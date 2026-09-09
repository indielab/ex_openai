defmodule ExOpenAI.Uploads do
  @moduledoc """
  Functions for the OpenAI uploads API.
  """
  (
    @doc """
    Creates an intermediate [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object
    that you can add [Parts](https://platform.openai.com/docs/api-reference/uploads/part-object) to.
    Currently, an Upload can accept at most 8 GB in total and expires after an
    hour after you create it.

    Once you complete the Upload, we will create a
    [File](https://platform.openai.com/docs/api-reference/files/object) object that contains all the parts
    you uploaded. This File is usable in the rest of our platform as a regular
    File object.

    For certain `purpose` values, the correct `mime_type` must be specified.
    Please refer to documentation for the
    [supported MIME types for your use case](https://platform.openai.com/docs/assistants/tools/file-search#supported-files).

    For guidance on the proper filename extensions for each purpose, please
    follow the documentation on [creating a
    File](https://platform.openai.com/docs/api-reference/files/create).

    Returns the Upload object with status `pending`.


    ## Parameters

    * `bytes` - **required** - `integer()`
      The number of bytes in the file you are uploading.

    * `filename` - **required** - `String.t()`
      The name of the file to upload.

    * `mime_type` - **required** - `String.t()`
      The MIME type of the file.


    This must fall within the supported MIME types for your file purpose. See
    the supported MIME types for assistants and vision.

    * `purpose` - **required** - `:assistants | :batch | :"fine-tune" | :vision | String.t()`
      The intended purpose of the uploaded file.

    See the [documentation on File
    purposes](https://platform.openai.com/docs/api-reference/files/create#files-create-purpose).
      Allowed values: `"assistants"`, `"batch"`, `"fine-tune"`, `"vision"`

    ## Options

    * `expires_after` - **optional** - `ExOpenAI.Components.FileExpirationAfter.input()`
    """
    (
      @type create_upload_opt() ::
              {:expires_after, ExOpenAI.Components.FileExpirationAfter.input()}
              | ExOpenAI.request_option()
      @spec create_upload(
              bytes :: integer(),
              filename :: String.t(),
              mime_type :: String.t(),
              purpose :: (((:assistants | :batch) | :"fine-tune") | :vision) | String.t(),
              opts :: [create_upload_opt()]
            ) :: {:ok, ExOpenAI.Components.Upload.t()} | {:error, any()}
    )

    def create_upload(bytes, filename, mime_type, purpose, opts \\ []) do
      url = "/uploads"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [bytes: bytes, filename: filename, mime_type: mime_type, purpose: purpose]
      optional_body_params = Keyword.take(opts, [:expires_after])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:expires_after] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Upload"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
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
    Cancels the Upload. No Parts may be added after an Upload is cancelled.

    Returns the Upload object with status `cancelled`.


    ## Parameters

    * `:upload_id` - **required** - `String.t()`
      The ID of the Upload.
    """
    (
      @type cancel_upload_opt() :: ExOpenAI.request_option()
      @spec cancel_upload(upload_id :: String.t(), opts :: [cancel_upload_opt()]) ::
              {:ok, ExOpenAI.Components.Upload.t()} | {:error, any()}
    )

    def cancel_upload(upload_id, opts \\ []) do
      url = "/uploads/{upload_id}/cancel"
      url = String.replace(url, "{upload_id}", to_string(upload_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Upload"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
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
    Completes the [Upload](https://platform.openai.com/docs/api-reference/uploads/object).

    Within the returned Upload object, there is a nested [File](https://platform.openai.com/docs/api-reference/files/object) object that is ready to use in the rest of the platform.

    You can specify the order of the Parts by passing in an ordered list of the Part IDs.

    The number of bytes uploaded upon completion must match the number of bytes initially specified when creating the Upload object. No Parts may be added after an Upload is completed.
    Returns the Upload object with status `completed`, including an additional `file` property containing the created usable File object.


    ## Parameters

    * `:upload_id` - **required** - `String.t()`
      The ID of the Upload.

    * `part_ids` - **required** - `list(String.t())`
      The ordered list of Part IDs.

    ## Options

    * `md5` - **optional** - `String.t()`
      The optional md5 checksum for the file contents to verify if the bytes uploaded matches what you expect.
    """
    (
      @type complete_upload_opt() :: {:md5, String.t()} | ExOpenAI.request_option()
      @spec complete_upload(
              part_ids :: list(String.t()),
              upload_id :: String.t(),
              opts :: [complete_upload_opt()]
            ) :: {:ok, ExOpenAI.Components.Upload.t()} | {:error, any()}
    )

    def complete_upload(part_ids, upload_id, opts \\ []) do
      url = "/uploads/{upload_id}/complete"
      url = String.replace(url, "{upload_id}", to_string(upload_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [part_ids: part_ids]
      optional_body_params = Keyword.take(opts, [:md5])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:md5] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Upload"}
        )
      end

      nil

      ExOpenAI.Config.http_client().api_call(
        :post,
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
    Adds a [Part](https://platform.openai.com/docs/api-reference/uploads/part-object) to an [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object. A Part represents a chunk of bytes from the file you are trying to upload.

    Each Part can be at most 64 MB, and you can add Parts until you hit the Upload maximum of 8 GB.

    It is possible to add multiple Parts in parallel. You can decide the intended order of the Parts when you [complete the Upload](https://platform.openai.com/docs/api-reference/uploads/complete).


    ## Parameters

    * `:upload_id` - **required** - `String.t()`
      The ID of the Upload.

    * `data` - **required** - `binary() | {String.t(), binary()}`
      The chunk of bytes for this Part.
      Format: `binary`
    """
    (
      @type add_upload_part_opt() :: ExOpenAI.request_option()
      @spec add_upload_part(
              data :: binary() | {String.t(), binary()},
              upload_id :: String.t(),
              opts :: [add_upload_part_opt()]
            ) :: {:ok, ExOpenAI.Components.UploadPart.t()} | {:error, any()}
    )

    def add_upload_part(data, upload_id, opts \\ []) do
      url = "/uploads/{upload_id}/parts"
      url = String.replace(url, "{upload_id}", to_string(upload_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [data: data]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UploadPart"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:data], %{})

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
end
