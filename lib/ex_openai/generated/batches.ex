defmodule ExOpenAI.Batches do
  @moduledoc false
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
    @spec list_batches(opts :: [{:after, String.t()} | {:limit, integer()}]) ::
            {:ok, ExOpenAI.Components.ListBatchesResponse.t()} | {:error, any()}
    def list_batches(opts \\ []) do
      url = "/batches"
      query_params = Keyword.take(opts, [:after, :limit])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListBatchesResponse"}
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
    Creates and executes a batch from an uploaded file of requests
    """
    @spec create_batch(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Batch.t()} | {:error, any()}
    def create_batch(opts \\ []) do
      url = "/batches"
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Batch"}
        )
      end

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
    @spec retrieve_batch(batch_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Batch.t()} | {:error, any()}
    def retrieve_batch(batch_id, opts \\ []) do
      url = "/batches/{batch_id}"
      url = String.replace(url, "{batch_id}", to_string(batch_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Batch"}
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
    Cancels an in-progress batch. The batch will be in status `cancelling` for up to 10 minutes, before changing to `cancelled`, where it will have partial results (if any) available in the output file.

    ## Parameters

    * `:batch_id` - **required** - `String.t()`  
      The ID of the batch to cancel.
    """
    @spec cancel_batch(batch_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Batch.t()} | {:error, any()}
    def cancel_batch(batch_id, opts \\ []) do
      url = "/batches/{batch_id}/cancel"
      url = String.replace(url, "{batch_id}", to_string(batch_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Batch"}
        )
      end

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
