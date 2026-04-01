defmodule ExOpenAI.Files do
  @moduledoc false
  (
    @doc """
    Returns a list of files.

    ## Options

    * `:purpose` - **optional** - `String.t()`  
      Only return files with the given purpose.

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 10,000, and the default is 10,000.  
      Default: `10000`

    * `:order` - **optional** - `String.t()`  
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    (
      @type list_files_opt() ::
              (({:purpose, String.t()} | {:limit, integer()}) | {:order, String.t()})
              | {:after, String.t()}
      @spec list_files(opts :: [list_files_opt()]) ::
              {:ok, ExOpenAI.Components.ListFilesResponse.t()} | {:error, any()}
    )

    def list_files(opts \\ []) do
      url = "/files"
      query_params = Keyword.take(opts, [:purpose, :limit, :order, :after])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order, :purpose])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :limit, :order, :purpose] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListFilesResponse"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Upload a file that can be used across various endpoints. Individual files
    can be up to 512 MB, and each project can store up to 2.5 TB of files in
    total. There is no organization-wide storage limit.

    - The Assistants API supports files up to 2 million tokens and of specific
      file types. See the [Assistants Tools guide](/docs/assistants/tools) for
      details.
    - The Fine-tuning API only supports `.jsonl` files. The input also has
      certain required formats for fine-tuning
      [chat](/docs/api-reference/fine-tuning/chat-input) or
      [completions](/docs/api-reference/fine-tuning/completions-input) models.
    - The Batch API only supports `.jsonl` files up to 200 MB in size. The input
      also has a specific required
      [format](/docs/api-reference/batch/request-input).

    Please [contact us](https://help.openai.com/) if you need to increase these
    storage limits.


    ## Parameters

    * `file` - **required** - `binary()`  
      The File object (not file name) to be uploaded.  
      Format: `binary`

    * `purpose` - **required** - `:assistants | :batch | :"fine-tune" | :vision | :user_data | :evals`  
      The intended purpose of the uploaded file. One of:
    - `assistants`: Used in the Assistants API
    - `batch`: Used in the Batch API
    - `fine-tune`: Used for fine-tuning
    - `vision`: Images used for vision fine-tuning
    - `user_data`: Flexible file type for any purpose
    - `evals`: Used for eval data sets  
      Allowed values: `"assistants"`, `"batch"`, `"fine-tune"`, `"vision"`, `"user_data"`, `"evals"`

    ## Options

    * `expires_after` - **optional** - `any()`
    """
    (
      @type create_file_opt() :: {:expires_after, ExOpenAI.Components.FileExpirationAfter.t()}
      @spec create_file(
              file :: binary(),
              purpose ::
                ((((:assistants | :batch) | :"fine-tune") | :vision) | :user_data) | :evals,
              opts :: [create_file_opt()]
            ) :: {:ok, ExOpenAI.Components.OpenAIFile.t()} | {:error, any()}
    )

    def create_file(file, purpose, opts \\ []) do
      url = "/files"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [file: file, purpose: purpose]
      optional_body_params = Keyword.take(opts, [:expires_after])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:expires_after] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/OpenAIFile"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Delete a file and remove it from all vector stores.

    ## Parameters

    * `:file_id` - **required** - `String.t()`  
      The ID of the file to use for this request.
    """
    (
      nil

      @spec delete_file(file_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.DeleteFileResponse.t()} | {:error, any()}
    )

    def delete_file(file_id, opts \\ []) do
      url = "/files/{file_id}"
      url = String.replace(url, "{file_id}", to_string(file_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeleteFileResponse"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :delete,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns information about a specific file.

    ## Parameters

    * `:file_id` - **required** - `String.t()`  
      The ID of the file to use for this request.
    """
    (
      nil

      @spec retrieve_file(file_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.OpenAIFile.t()} | {:error, any()}
    )

    def retrieve_file(file_id, opts \\ []) do
      url = "/files/{file_id}"
      url = String.replace(url, "{file_id}", to_string(file_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/OpenAIFile"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns the contents of the specified file.

    ## Parameters

    * `:file_id` - **required** - `String.t()`  
      The ID of the file to use for this request.
    """
    (
      nil

      @spec download_file(file_id :: String.t(), opts :: keyword()) ::
              {:ok, map()} | {:error, any()}
    )

    def download_file(file_id, opts \\ []) do
      url = "/files/{file_id}/content"
      url = String.replace(url, "{file_id}", to_string(file_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )
end
