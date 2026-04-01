defmodule ExOpenAI.Containers do
  @moduledoc false
  (
    @doc """
    List Containers

    Lists containers.

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

    * `:name` - **optional** - `String.t()`  
      Filter results by container name.
    """
    @spec list_containers(
            opts :: [
              (({:limit, integer()} | {:order, String.t()}) | {:after, String.t()})
              | {:name, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ContainerListResource.t()} | {:error, any()}
    def list_containers(opts \\ []) do
      url = "/containers"
      query_params = Keyword.take(opts, [:limit, :order, :after, :name])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :name, :order])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :name, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/ContainerListResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Create Container

    Creates a container.

    ## Parameters

    * `name` - **required** - `String.t()`  
      Name of the container to create.

    ## Options

    * `expires_after` - **optional** - `any()`  
      Container expiration time in seconds relative to the 'anchor' time.

    * `file_ids` - **optional** - `[String.t()]`  
      IDs of files to copy to the container.

    * `memory_limit` - **optional** - `:"1g" | :"4g" | :"16g" | :"64g"`  
      Optional memory limit for the container. Defaults to "1g".  
      Allowed values: `"1g"`, `"4g"`, `"16g"`, `"64g"`

    * `network_policy` - **optional** - `any() | any()`  
      Network access policy for the container.

    * `skills` - **optional** - `[any() | any()]`  
      An optional list of skills referenced by id or inline data.
    """
    @spec create_container(
            opts :: [
              ((({:expires_after,
                  %{required(:anchor) => :last_active_at, required(:minutes) => integer()}}
                 | {:file_ids, list(String.t())})
                | {:memory_limit, ((:"1g" | :"4g") | :"16g") | :"64g"})
               | {:network_policy,
                  ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t()
                  | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t()})
              | {:skills,
                 list(
                   ExOpenAI.Components.SkillReferenceParam.t()
                   | ExOpenAI.Components.InlineSkillParam.t()
                 )}
            ]
          ) :: {:ok, ExOpenAI.Components.ContainerResource.t()} | {:error, any()}
    def create_container(opts \\ []) do
      url = "/containers"
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
        Keyword.take(opts, [:expires_after, :file_ids, :memory_limit, :network_policy, :skills])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:expires_after, :file_ids, :memory_limit, :network_policy, :skills]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/ContainerResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Delete Container

    Delete a container.

    ## Parameters

    * `:container_id` - **required** - `String.t()`  
      The ID of the container to delete.
    """
    @spec delete_container(container_id :: String.t(), opts :: keyword()) ::
            {:ok, map()} | {:error, any()}
    def delete_container(container_id, opts \\ []) do
      url = "/containers/{container_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
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
    Retrieve Container

    Retrieves a container.

    ## Parameters

    * `:container_id` - **required** - `String.t()`
    """
    @spec retrieve_container(container_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.ContainerResource.t()} | {:error, any()}
    def retrieve_container(container_id, opts \\ []) do
      url = "/containers/{container_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
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
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/ContainerResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    List Container files

    Lists container files.

    ## Parameters

    * `:container_id` - **required** - `String.t()`

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
    """
    @spec list_container_files(
            container_id :: String.t(),
            opts :: [({:limit, integer()} | {:order, String.t()}) | {:after, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ContainerFileListResource.t()} | {:error, any()}
    def list_container_files(container_id, opts \\ []) do
      url = "/containers/{container_id}/files"
      url = String.replace(url, "{container_id}", to_string(container_id))
      query_params = Keyword.take(opts, [:limit, :order, :after])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit, :order])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/ContainerFileListResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Create a Container File

    You can send either a multipart/form-data request with the raw file content, or a JSON request with a file ID.


    Creates a container file.


    ## Parameters

    * `:container_id` - **required** - `String.t()`

    ## Options

    * `file` - **optional** - `binary()`  
      The File object (not file name) to be uploaded.  
      Format: `binary`

    * `file_id` - **optional** - `String.t()`  
      Name of the file to create.
    """
    @spec create_container_file(
            container_id :: String.t(),
            opts :: [{:file, binary()} | {:file_id, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ContainerFileResource.t()} | {:error, any()}
    def create_container_file(container_id, opts \\ []) do
      url = "/containers/{container_id}/files"
      url = String.replace(url, "{container_id}", to_string(container_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:file, :file_id])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:file, :file_id] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/ContainerFileResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Delete Container File

    Delete a container file.

    ## Parameters

    * `:container_id` - **required** - `String.t()`

    * `:file_id` - **required** - `String.t()`
    """
    @spec delete_container_file(
            container_id :: String.t(),
            file_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, map()} | {:error, any()}
    def delete_container_file(container_id, file_id, opts \\ []) do
      url = "/containers/{container_id}/files/{file_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
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
    Retrieve Container File

    Retrieves a container file.

    ## Parameters

    * `:container_id` - **required** - `String.t()`

    * `:file_id` - **required** - `String.t()`
    """
    @spec retrieve_container_file(
            container_id :: String.t(),
            file_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ContainerFileResource.t()} | {:error, any()}
    def retrieve_container_file(container_id, file_id, opts \\ []) do
      url = "/containers/{container_id}/files/{file_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
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
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, %{
          __struct__: ExOpenAI.Codegen.DocsParser.Schema,
          additional_properties: nil,
          all_of: nil,
          any_of: nil,
          default: nil,
          deprecated: nil,
          description: nil,
          discriminator: nil,
          enum: nil,
          example: nil,
          format: nil,
          items: nil,
          name: nil,
          nullable: nil,
          one_of: nil,
          properties: nil,
          raw: nil,
          read_only: nil,
          ref: "#/components/schemas/ContainerFileResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Retrieve Container File Content

    Retrieves a container file content.

    ## Parameters

    * `:container_id` - **required** - `String.t()`

    * `:file_id` - **required** - `String.t()`
    """
    @spec retrieve_container_file_content(
            container_id :: String.t(),
            file_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, map()} | {:error, any()}
    def retrieve_container_file_content(container_id, file_id, opts \\ []) do
      url = "/containers/{container_id}/files/{file_id}/content"
      url = String.replace(url, "{container_id}", to_string(container_id))
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
