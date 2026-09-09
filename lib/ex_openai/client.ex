defmodule ExOpenAI.Client do
  @moduledoc false
  use HTTPoison.Base
  alias ExOpenAI.Config

  def add_base_url(url, base_url), do: Config.api_url(base_url) <> url

  def process_response(%HTTPoison.Response{headers: headers, body: body} = response) do
    json? =
      Enum.any?(headers, fn {name, value} ->
        String.downcase(name) == "content-type" and
          String.downcase(value) |> String.split(";") |> hd() |> String.trim() ==
            "application/json"
      end)

    if json? do
      case Jason.decode(body) do
        {:ok, decoded} -> %{response | body: decoded}
        _ -> response
      end
    else
      response
    end
  end

  def handle_response(httpoison_response) do
    case httpoison_response do
      {:ok, %HTTPoison.Response{status_code: code, body: {:ok, body}}} when code in 200..299 ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: code, body: body}} when code in 200..299 ->
        {:ok, body}

      {:ok, %HTTPoison.Response{body: {:ok, body}}} ->
        {:error, body}

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, body}

      {:ok, %HTTPoison.AsyncResponse{id: ref}} ->
        {:ok, ref}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  @spec add_bearer_header(list(), String.t() | nil) :: list()
  def add_bearer_header(headers, api_key \\ nil) do
    if is_nil(api_key) do
      [{"Authorization", "Bearer #{Config.api_key()}"} | headers]
    else
      [{"Authorization", "Bearer #{api_key}"} | headers]
    end
  end

  @spec add_organization_header(list(), String.t() | nil) :: list()
  def add_organization_header(headers, org_key \\ nil) do
    if is_nil(org_key) do
      if Config.org_key() do
        [{"OpenAI-Organization", Config.org_key()} | headers]
      else
        headers
      end
    else
      [{"OpenAI-Organization", org_key} | headers]
    end
  end

  @spec add_json_request_headers(list()) :: list()
  def add_json_request_headers(headers) do
    [{"Content-type", "application/json"} | headers]
  end

  @spec add_multipart_request_headers(list()) :: list()
  def add_multipart_request_headers(headers) do
    [{"Content-type", "multipart/form-data"} | headers]
  end

  def request_options, do: Config.http_options()

  def default_headers, do: Config.http_headers()

  def stream_options(request_options, convert_response) do
    with {:ok, stream_val} <- Keyword.fetch(request_options, :stream),
         {:ok, stream_to} when is_pid(stream_to) or is_function(stream_to, 1) <-
           Keyword.fetch(request_options, :stream_to),
         true <- stream_val do
      # spawn a new StreamingClient and tell it to forward data to `stream_to`
      {:ok, sse_client_pid} = ExOpenAI.StreamingClient.start_link(stream_to, convert_response)
      [stream_to: sse_client_pid]
    else
      _ ->
        [stream_to: nil]
    end
  end

  def api_get(url, request_options \\ [], convert_response) do
    request_options = Keyword.merge(request_options(), request_options)
    stream_options = stream_options(request_options, convert_response)

    request_options =
      Map.merge(Enum.into(request_options, %{}), Enum.into(stream_options, %{}))
      |> Map.to_list()

    request_options_map = Enum.into(request_options, %{})

    headers =
      default_headers()
      |> add_json_request_headers()
      |> add_organization_header(Map.get(request_options_map, :openai_organization_key, nil))
      |> add_bearer_header(Map.get(request_options_map, :openai_api_key, nil))

    base_url = Map.get(request_options_map, :base_url)

    url
    |> add_base_url(base_url)
    |> get(headers, request_options)
    |> finish_request(stream_options, convert_response)
  end

  defp strip_params(params) do
    params
    # remove stream_to from params as PID messes with Jason
    |> Map.drop([:stream_to, :openai_organization_key, :openai_api_key, :base_url])
  end

  def api_post(url, params \\ [], request_options \\ [], convert_response) do
    body =
      params
      |> Enum.into(%{})
      |> strip_params()
      |> Jason.encode!()

    request_options = Keyword.merge(request_options(), request_options)
    stream_options = stream_options(request_options, convert_response)

    request_options =
      Map.merge(Enum.into(request_options, %{}), Enum.into(stream_options, %{}))
      |> Map.to_list()

    request_options_map = Enum.into(request_options, %{})

    headers =
      default_headers()
      |> add_json_request_headers()
      |> add_organization_header(Map.get(request_options_map, :openai_organization_key, nil))
      |> add_bearer_header(Map.get(request_options_map, :openai_api_key, nil))

    base_url = Map.get(request_options_map, :base_url)

    url
    |> add_base_url(base_url)
    |> post(body, headers, request_options)
    |> finish_request(stream_options, convert_response)
  end

  def api_delete(url, request_options \\ [], convert_response) do
    request_options = Keyword.merge(request_options(), request_options)
    stream_options = stream_options(request_options, convert_response)

    request_options =
      Map.merge(Enum.into(request_options, %{}), Enum.into(stream_options, %{}))
      |> Map.to_list()

    request_options_map = Enum.into(request_options, %{})

    headers =
      default_headers()
      |> add_json_request_headers()
      |> add_organization_header(Map.get(request_options_map, :openai_organization_key, nil))
      |> add_bearer_header(Map.get(request_options_map, :openai_api_key, nil))

    base_url = Map.get(request_options_map, :base_url)

    url
    |> add_base_url(base_url)
    |> delete(headers, request_options)
    |> finish_request(stream_options, convert_response)
  end

  @doc false
  def prepare_multipart(params, file_fields, encoding \\ %{}) do
    Enum.map(params, fn {name, value} ->
      value = if name in file_fields, do: upload_value(to_string(name), value), else: value

      case get_in(encoding, [to_string(name), "contentType"]) do
        nil -> {name, value}
        content_type -> {name, {:content_type, content_type, value}}
      end
    end)
  end

  defp upload_value(name, value) when is_binary(value), do: {name, value}

  defp upload_value(name, values) when is_list(values),
    do: Enum.map(values, &upload_value(name, &1))

  defp upload_value(_name, value), do: value

  defp multipart_param({_name, nil}), do: []

  defp multipart_param({name, {:content_type, content_type, value}}) do
    body = if content_type == "application/json", do: Jason.encode!(value), else: to_string(value)
    [{to_string(name), body, [{"Content-Type", content_type}]}]
  end

  defp multipart_param({name, {filename, content}}) when is_binary(content) do
    filename = to_string(filename)

    [
      {"file", content,
       {"form-data",
        [name: quote_form_parameter(name), filename: quote_form_parameter(filename)]},
       [{"Content-Type", MIME.from_path(filename)}]}
    ]
  end

  defp multipart_param({name, %_{} = value}), do: multipart_param({name, Map.from_struct(value)})

  defp multipart_param({name, value}) when is_map(value) do
    value
    |> Enum.sort_by(fn {key, _} -> to_string(key) end)
    |> Enum.flat_map(fn {key, item} -> multipart_param({"#{name}[#{key}]", item}) end)
  end

  defp multipart_param({name, values}) when is_list(values) do
    Enum.flat_map(values, &multipart_param({"#{name}[]", &1}))
  end

  defp multipart_param({name, value}) when is_binary(value) do
    if String.valid?(value) do
      [{to_string(name), value}]
    else
      multipart_param({name, {to_string(name), value}})
    end
  end

  defp multipart_param({name, value}), do: [{to_string(name), to_string(value)}]

  defp quote_form_parameter(value) do
    value =
      value
      |> to_string()
      |> String.replace("\r", "%0D")
      |> String.replace("\n", "%0A")
      |> String.replace("\"", "%22")

    "\"" <> value <> "\""
  end

  def api_multipart_post(url, params \\ [], request_options \\ [], convert_response) do
    request_options = Keyword.merge(request_options(), request_options)
    stream_options = stream_options(request_options, convert_response)

    request_options =
      Map.merge(Enum.into(request_options, %{}), Enum.into(stream_options, %{}))
      |> Map.to_list()

    request_options_map = Enum.into(request_options, %{})

    multipart_body =
      {:multipart,
       params
       |> Enum.into(%{})
       |> strip_params()
       |> Map.to_list()
       |> Enum.flat_map(&multipart_param/1)}

    headers =
      default_headers()
      |> add_multipart_request_headers()
      |> add_organization_header(Map.get(request_options_map, :openai_organization_key, nil))
      |> add_bearer_header(Map.get(request_options_map, :openai_api_key, nil))

    base_url = Map.get(request_options_map, :base_url)

    url
    |> add_base_url(base_url)
    |> post(multipart_body, headers, request_options)
    |> finish_request(stream_options, convert_response)
  end

  defp finish_request(response, stream_options, convert_response) do
    result = handle_response(response)

    if match?({:error, _}, result) and is_pid(stream_options[:stream_to]) do
      GenServer.cast(stream_options[:stream_to], :stop)
    end

    convert_response.(result)
  end

  @callback api_call(
              method :: atom(),
              url :: String.t(),
              params :: Keyword.t(),
              request_content_type :: atom(),
              request_options :: Keyword.t(),
              convert_response :: any()
            ) :: {:ok, res :: term()} | {:error, res :: term()}
  def api_call(:get, url, _params, _request_content_type, request_options, convert_response),
    do: api_get(url, request_options, convert_response)

  def api_call(:post, url, params, :"multipart/form-data", request_options, convert_response),
    do: api_multipart_post(url, params, request_options, convert_response)

  def api_call(:post, url, params, _request_content_type, request_options, convert_response),
    do: api_post(url, params, request_options, convert_response)

  def api_call(:delete, url, _params, _request_content_type, request_options, convert_response),
    do: api_delete(url, request_options, convert_response)
end
