defmodule ExOpenAI.Batches do
  @moduledoc """
  Functions for the OpenAI batches API.
  """
  (
    @doc """
    List your organization's batches.

    ## Options

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`
    """
    (
      @type list_batches_opt() ::
              ({:after, String.t()} | {:limit, integer()}) | ExOpenAI.request_option()
      @spec list_batches(opts :: [list_batches_opt()]) ::
              {:ok, ExOpenAI.Components.ListBatchesResponse.t()} | {:error, any()}
    )

    def list_batches(opts \\ []) do
      url = "/batches"
      query_params = Keyword.take(opts, [:after, :limit])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListBatchesResponse"}
        )
      end

      nil

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
    Creates and executes a batch from an uploaded file of requests

    ## Parameters

    * `completion_window` - **required** - `:"24h" | String.t()`
      The time frame within which the batch should be processed. Currently only `24h` is supported.
      Allowed values: `"24h"`

    * `endpoint` - **required** - `:"/v1/responses" | :"/v1/chat/completions" | :"/v1/embeddings" | :"/v1/completions" | :"/v1/moderations" | :"/v1/images/generations" | :"/v1/images/edits" | :"/v1/videos" | String.t()`
      The endpoint to be used for all requests in the batch. Currently `/v1/responses`, `/v1/chat/completions`, `/v1/embeddings`, `/v1/completions`, `/v1/moderations`, `/v1/images/generations`, `/v1/images/edits`, and `/v1/videos` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
      Allowed values: `"/v1/responses"`, `"/v1/chat/completions"`, `"/v1/embeddings"`, `"/v1/completions"`, `"/v1/moderations"`, `"/v1/images/generations"`, `"/v1/images/edits"`, `"/v1/videos"`

    * `input_file_id` - **required** - `String.t()`
      The ID of an uploaded file that contains requests for the new batch.

    See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.

    Your input file must be formatted as a [JSONL file](https://platform.openai.com/docs/api-reference/batch/request-input), and must be uploaded with the purpose `batch`. The file can contain up to 50,000 requests, and can be up to 200 MB in size.

    ## Options

    * `metadata` - **optional** - `ExOpenAI.Components.Metadata.input()`

    * `output_expires_after` - **optional** - `ExOpenAI.Components.BatchFileExpirationAfter.input()`
    """
    (
      @type create_batch_opt() ::
              ({:metadata, ExOpenAI.Components.Metadata.input()}
               | {:output_expires_after, ExOpenAI.Components.BatchFileExpirationAfter.input()})
              | ExOpenAI.request_option()
      @spec create_batch(
              completion_window :: :"24h" | String.t(),
              endpoint ::
                (((((((:"/v1/responses" | :"/v1/chat/completions") | :"/v1/embeddings")
                     | :"/v1/completions")
                    | :"/v1/moderations")
                   | :"/v1/images/generations")
                  | :"/v1/images/edits")
                 | :"/v1/videos")
                | String.t(),
              input_file_id :: String.t(),
              opts :: [create_batch_opt()]
            ) :: {:ok, ExOpenAI.Components.Batch.t()} | {:error, any()}
    )

    def create_batch(completion_window, endpoint, input_file_id, opts \\ []) do
      url = "/batches"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)

      body_params = [
        completion_window: completion_window,
        endpoint: endpoint,
        input_file_id: input_file_id
      ]

      optional_body_params = Keyword.take(opts, [:metadata, :output_expires_after])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:metadata, :output_expires_after] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Batch"}
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
    Retrieves a batch.

    ## Parameters

    * `:batch_id` - **required** - `String.t()`
      The ID of the batch to retrieve.
    """
    (
      @type retrieve_batch_opt() :: ExOpenAI.request_option()
      @spec retrieve_batch(batch_id :: String.t(), opts :: [retrieve_batch_opt()]) ::
              {:ok, ExOpenAI.Components.Batch.t()} | {:error, any()}
    )

    def retrieve_batch(batch_id, opts \\ []) do
      url = "/batches/{batch_id}"
      url = String.replace(url, "{batch_id}", to_string(batch_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Batch"}
        )
      end

      nil

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
    Cancels an in-progress batch. The batch will be in status `cancelling` for up to 10 minutes, before changing to `cancelled`, where it will have partial results (if any) available in the output file.

    ## Parameters

    * `:batch_id` - **required** - `String.t()`
      The ID of the batch to cancel.
    """
    (
      @type cancel_batch_opt() :: ExOpenAI.request_option()
      @spec cancel_batch(batch_id :: String.t(), opts :: [cancel_batch_opt()]) ::
              {:ok, ExOpenAI.Components.Batch.t()} | {:error, any()}
    )

    def cancel_batch(batch_id, opts \\ []) do
      url = "/batches/{batch_id}/cancel"
      url = String.replace(url, "{batch_id}", to_string(batch_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Batch"}
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
end
