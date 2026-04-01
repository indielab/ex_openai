defmodule ExOpenAI.VectorStores do
  @moduledoc false
  (
    @doc """
    Returns a list of vector stores.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`  
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    """
    (
      @type list_vector_stores_opt() ::
              (({:limit, integer()} | {:order, String.t()}) | {:after, String.t()})
              | {:before, String.t()}
      @spec list_vector_stores(opts :: [list_vector_stores_opt()]) ::
              {:ok, ExOpenAI.Components.ListVectorStoresResponse.t()} | {:error, any()}
    )

    def list_vector_stores(opts \\ []) do
      url = "/vector_stores"
      query_params = Keyword.take(opts, [:limit, :order, :after, :before])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :before, :limit, :order])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListVectorStoresResponse"
          }
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
    Create a vector store.

    ## Options

    * `chunking_strategy` - **optional** - `map()`  
      The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file_ids` is non-empty.

    * `description` - **optional** - `String.t()`  
      A description for the vector store. Can be used to describe the vector store's purpose.

    * `expires_after` - **optional** - `any()`

    * `file_ids` - **optional** - `[String.t()]`  
      A list of [File](/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file_search` that can access files.  
      Constraints: maxItems: 500

    * `metadata` - **optional** - `any()`

    * `name` - **optional** - `String.t()`  
      The name of the vector store.
    """
    (
      @type create_vector_store_opt() ::
              (((({:chunking_strategy, map()} | {:description, String.t()})
                 | {:expires_after, ExOpenAI.Components.VectorStoreExpirationAfter.t()})
                | {:file_ids, list(String.t())})
               | {:metadata, ExOpenAI.Components.Metadata.t()})
              | {:name, String.t()}
      @spec create_vector_store(opts :: [create_vector_store_opt()]) ::
              {:ok, ExOpenAI.Components.VectorStoreObject.t()} | {:error, any()}
    )

    def create_vector_store(opts \\ []) do
      url = "/vector_stores"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :chunking_strategy,
          :description,
          :expires_after,
          :file_ids,
          :metadata,
          :name
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:chunking_strategy, :description, :expires_after, :file_ids, :metadata, :name]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VectorStoreObject"}
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
    Delete a vector store.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store to delete.
    """
    (
      nil

      @spec delete_vector_store(vector_store_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.DeleteVectorStoreResponse.t()} | {:error, any()}
    )

    def delete_vector_store(vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/DeleteVectorStoreResponse"
          }
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
    Retrieves a vector store.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store to retrieve.
    """
    (
      nil

      @spec get_vector_store(vector_store_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.VectorStoreObject.t()} | {:error, any()}
    )

    def get_vector_store(vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VectorStoreObject"}
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
    Modifies a vector store.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store to modify.

    ## Options

    * `expires_after` - **optional** - `map()`

    * `metadata` - **optional** - `any()`

    * `name` - **optional** - `String.t() | nil`  
      The name of the vector store.
    """
    (
      @type modify_vector_store_opt() ::
              ({:expires_after,
                %{required(:anchor) => :last_active_at, required(:days) => integer()}}
               | {:metadata, ExOpenAI.Components.Metadata.t()})
              | {:name, String.t() | nil}
      @spec modify_vector_store(
              vector_store_id :: String.t(),
              opts :: [modify_vector_store_opt()]
            ) :: {:ok, ExOpenAI.Components.VectorStoreObject.t()} | {:error, any()}
    )

    def modify_vector_store(vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:expires_after, :metadata, :name])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:expires_after, :metadata, :name] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VectorStoreObject"}
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
    Create a vector store file batch.

    The maximum number of files in a single batch request is 2000.
    Vector store file attach requests are rate limited per vector store (300 requests per minute across both this endpoint and `/vector_stores/{vector_store_id}/files`).
    For ingesting multiple files into the same vector store, this batch endpoint is recommended.


    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store for which to create a File Batch.

    ## Options

    * `attributes` - **optional** - `any()`

    * `chunking_strategy` - **optional** - `any()`

    * `file_ids` - **optional** - `[String.t()]`  
      A list of [File](/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file_search` that can access files.  If `attributes` or `chunking_strategy` are provided, they will be  applied to all files in the batch. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `files`.  
      Constraints: minItems: 1, maxItems: 2000

    * `files` - **optional** - `[any()]`  
      A list of objects that each include a `file_id` plus optional `attributes` or `chunking_strategy`. Use this when you need to override metadata for specific files. The global `attributes` or `chunking_strategy` will be ignored and must be specified for each file. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `file_ids`.  
      Constraints: minItems: 1, maxItems: 2000
    """
    (
      @type create_vector_store_file_batch_opt() ::
              (({:attributes, ExOpenAI.Components.VectorStoreFileAttributes.t()}
                | {:chunking_strategy, ExOpenAI.Components.ChunkingStrategyRequestParam.t()})
               | {:file_ids, list(String.t())})
              | {:files, list(ExOpenAI.Components.CreateVectorStoreFileRequest.t())}
      @spec create_vector_store_file_batch(
              vector_store_id :: String.t(),
              opts :: [create_vector_store_file_batch_opt()]
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileBatchObject.t()} | {:error, any()}
    )

    def create_vector_store_file_batch(vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/file_batches"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []

      optional_body_params =
        Keyword.take(opts, [:attributes, :chunking_strategy, :file_ids, :files])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:attributes, :chunking_strategy, :file_ids, :files] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VectorStoreFileBatchObject"
          }
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
    Retrieves a vector store file batch.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store that the file batch belongs to.

    * `:batch_id` - **required** - `String.t()`  
      The ID of the file batch being retrieved.
    """
    (
      nil

      @spec get_vector_store_file_batch(
              batch_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileBatchObject.t()} | {:error, any()}
    )

    def get_vector_store_file_batch(batch_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/file_batches/{batch_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VectorStoreFileBatchObject"
          }
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
    Cancel a vector store file batch. This attempts to cancel the processing of files in this batch as soon as possible.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store that the file batch belongs to.

    * `:batch_id` - **required** - `String.t()`  
      The ID of the file batch to cancel.
    """
    (
      nil

      @spec cancel_vector_store_file_batch(
              batch_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileBatchObject.t()} | {:error, any()}
    )

    def cancel_vector_store_file_batch(batch_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/file_batches/{batch_id}/cancel"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VectorStoreFileBatchObject"
          }
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
    Returns a list of vector store files in a batch.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store that the files belong to.

    * `:batch_id` - **required** - `String.t()`  
      The ID of the file batch that the files belong to.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`  
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

    * `:filter` - **optional** - `String.t()`  
      Filter by file status. One of `in_progress`, `completed`, `failed`, `cancelled`.  
      Allowed values: `"in_progress"`, `"completed"`, `"failed"`, `"cancelled"`
    """
    (
      @type list_files_in_vector_store_batch_opt() ::
              ((({:limit, integer()} | {:order, String.t()}) | {:after, String.t()})
               | {:before, String.t()})
              | {:filter, String.t()}
      @spec list_files_in_vector_store_batch(
              batch_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: [list_files_in_vector_store_batch_opt()]
            ) :: {:ok, ExOpenAI.Components.ListVectorStoreFilesResponse.t()} | {:error, any()}
    )

    def list_files_in_vector_store_batch(batch_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/file_batches/{batch_id}/files"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      url = String.replace(url, "{batch_id}", to_string(batch_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before, :filter])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :before, :filter, :limit, :order])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :before, :filter, :limit, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListVectorStoreFilesResponse"
          }
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
    Returns a list of vector store files.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store that the files belong to.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:order` - **optional** - `String.t()`  
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`  
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

    * `:filter` - **optional** - `String.t()`  
      Filter by file status. One of `in_progress`, `completed`, `failed`, `cancelled`.  
      Allowed values: `"in_progress"`, `"completed"`, `"failed"`, `"cancelled"`
    """
    (
      @type list_vector_store_files_opt() ::
              ((({:limit, integer()} | {:order, String.t()}) | {:after, String.t()})
               | {:before, String.t()})
              | {:filter, String.t()}
      @spec list_vector_store_files(
              vector_store_id :: String.t(),
              opts :: [list_vector_store_files_opt()]
            ) :: {:ok, ExOpenAI.Components.ListVectorStoreFilesResponse.t()} | {:error, any()}
    )

    def list_vector_store_files(vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/files"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before, :filter])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :before, :filter, :limit, :order])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :before, :filter, :limit, :order] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ListVectorStoreFilesResponse"
          }
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
    Create a vector store file by attaching a [File](/docs/api-reference/files) to a [vector store](/docs/api-reference/vector-stores/object).

    This endpoint is subject to a per-vector-store write rate limit of 300 requests per minute, shared with `/vector_stores/{vector_store_id}/file_batches`.
    For uploading multiple files to the same vector store, use the file batches endpoint to reduce request volume.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store for which to create a File.

    * `file_id` - **required** - `String.t()`  
      A [File](/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file_search` that can access files. For multi-file ingestion, we recommend [`file_batches`](/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.

    ## Options

    * `attributes` - **optional** - `any()`

    * `chunking_strategy` - **optional** - `any()`
    """
    (
      @type create_vector_store_file_opt() ::
              {:attributes, ExOpenAI.Components.VectorStoreFileAttributes.t()}
              | {:chunking_strategy, ExOpenAI.Components.ChunkingStrategyRequestParam.t()}
      @spec create_vector_store_file(
              file_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: [create_vector_store_file_opt()]
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileObject.t()} | {:error, any()}
    )

    def create_vector_store_file(file_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/files"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [file_id: file_id]
      optional_body_params = Keyword.take(opts, [:attributes, :chunking_strategy])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:attributes, :chunking_strategy] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VectorStoreFileObject"}
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
    Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](/docs/api-reference/files/delete) endpoint.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store that the file belongs to.

    * `:file_id` - **required** - `String.t()`  
      The ID of the file to delete.
    """
    (
      nil

      @spec delete_vector_store_file(
              file_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.DeleteVectorStoreFileResponse.t()} | {:error, any()}
    )

    def delete_vector_store_file(file_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/files/{file_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/DeleteVectorStoreFileResponse"
          }
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
    Retrieves a vector store file.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store that the file belongs to.

    * `:file_id` - **required** - `String.t()`  
      The ID of the file being retrieved.
    """
    (
      nil

      @spec get_vector_store_file(
              file_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileObject.t()} | {:error, any()}
    )

    def get_vector_store_file(file_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/files/{file_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VectorStoreFileObject"}
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
    Update attributes on a vector store file.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store the file belongs to.

    * `:file_id` - **required** - `String.t()`  
      The ID of the file to update attributes.

    * `attributes` - **required** - `any()`
    """
    (
      nil

      @spec update_vector_store_file_attributes(
              attributes :: ExOpenAI.Components.VectorStoreFileAttributes.t(),
              file_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileObject.t()} | {:error, any()}
    )

    def update_vector_store_file_attributes(attributes, file_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/files/{file_id}"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      url = String.replace(url, "{file_id}", to_string(file_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [attributes: attributes]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VectorStoreFileObject"}
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
    Retrieve the parsed contents of a vector store file.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store.

    * `:file_id` - **required** - `String.t()`  
      The ID of the file within the vector store.
    """
    (
      nil

      @spec retrieve_vector_store_file_content(
              file_id :: String.t(),
              vector_store_id :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VectorStoreFileContentResponse.t()} | {:error, any()}
    )

    def retrieve_vector_store_file_content(file_id, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/files/{file_id}/content"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VectorStoreFileContentResponse"
          }
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
    Search a vector store for relevant chunks based on a query and file attributes filter.

    ## Parameters

    * `:vector_store_id` - **required** - `String.t()`  
      The ID of the vector store to search.

    * `query` - **required** - `String.t() | [String.t()]`  
      A query string for a search

    ## Options

    * `filters` - **optional** - `any() | any()`  
      A filter to apply based on file attributes.

    * `max_num_results` - **optional** - `integer()`  
      The maximum number of results to return. This number should be between 1 and 50 inclusive.  
      Default: `10`  
      Constraints: minimum: 1, maximum: 50

    * `ranking_options` - **optional** - `any()`  
      Ranking options for search.

    * `rewrite_query` - **optional** - `boolean()`  
      Whether to rewrite the natural language query for vector search.  
      Default: `false`
    """
    (
      @type search_vector_store_opt() ::
              (({:filters,
                 ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t()}
                | {:max_num_results, integer()})
               | {:ranking_options,
                  %{
                    optional(:ranker) => (:none | :auto) | :"default-2024-11-15",
                    optional(:score_threshold) => number()
                  }})
              | {:rewrite_query, boolean()}
      @spec search_vector_store(
              query :: String.t() | list(String.t()),
              vector_store_id :: String.t(),
              opts :: [search_vector_store_opt()]
            ) :: {:ok, ExOpenAI.Components.VectorStoreSearchResultsPage.t()} | {:error, any()}
    )

    def search_vector_store(query, vector_store_id, opts \\ []) do
      url = "/vector_stores/{vector_store_id}/search"
      url = String.replace(url, "{vector_store_id}", to_string(vector_store_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [query: query]

      optional_body_params =
        Keyword.take(opts, [:filters, :max_num_results, :ranking_options, :rewrite_query])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:filters, :max_num_results, :ranking_options, :rewrite_query]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VectorStoreSearchResultsPage"
          }
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
