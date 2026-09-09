defmodule ExOpenAI.Query do
  @moduledoc false

  def append(url, params) do
    query =
      params
      |> Enum.flat_map(fn {key, value} -> pairs(to_string(key), value) end)
      |> URI.encode_query()

    case query do
      "" -> url
      _ -> url <> if(String.contains?(url, "?"), do: "&", else: "?") <> query
    end
  end

  defp pairs(_key, nil), do: []

  defp pairs(key, values) when is_list(values) do
    # OpenAI's SDKs use repeated bracketed keys for array filters.
    key = if String.ends_with?(key, "[]"), do: key, else: key <> "[]"
    Enum.flat_map(values, &pairs(key, &1))
  end

  defp pairs(key, values) when is_map(values) do
    values
    |> Enum.sort_by(fn {name, _} -> to_string(name) end)
    |> Enum.flat_map(fn {name, value} -> pairs("#{key}[#{name}]", value) end)
  end

  defp pairs(key, value), do: [{key, to_string(value)}]
end
