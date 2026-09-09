defmodule ExOpenAI.Containers do
  @moduledoc """
  Functions for the OpenAI containers API.
  """
  (
    @doc """
    List Containers

    Lists containers.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:name` - **optional** - `String.t()`
      Filter results by container name.
    """
    (
      @type list_containers_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:name, String.t()})
              | ExOpenAI.request_option()
      @spec list_containers(opts :: [list_containers_opt()]) ::
              {:ok, ExOpenAI.Components.ContainerListResource.t()} | {:error, any()}
    )

    def list_containers(opts \\ []) do
      url = "/containers"
      query_params = Keyword.take(opts, [:limit, :order, :after, :name])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :name, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ContainerListResource"}
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
    Create Container

    Creates a container.

    ## Options

    * `expires_after` - **optional** - `%{required(:anchor) => :last_active_at | String.t(), required(:minutes) => integer()}`
      Container expiration time in seconds relative to the 'anchor' time.

    * `file_ids` - **optional** - `list(String.t())`
      IDs of files to copy to the container.

    * `memory_limit` - **optional** - `:"1g" | :"4g" | :"16g" | :"64g" | String.t()`
      Optional memory limit for the container. Defaults to "1g".
      Allowed values: `"1g"`, `"4g"`, `"16g"`, `"64g"`

    * `name` - **optional** - `String.t()`
      Name of the container to create.

    * `network_policy` - **optional** - `ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.input() | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.input()`
      Network access policy for the container.

    * `skills` - **optional** - `list( ExOpenAI.Components.SkillReferenceParam.input() | ExOpenAI.Components.InlineSkillParam.input() )`
      An optional list of skills referenced by id or inline data.
    """
    (
      @type create_container_opt() ::
              ((((({:expires_after,
                    %{
                      required(:anchor) => :last_active_at | String.t(),
                      required(:minutes) => integer()
                    }}
                   | {:file_ids, list(String.t())})
                  | {:memory_limit, (((:"1g" | :"4g") | :"16g") | :"64g") | String.t()})
                 | {:name, String.t()})
                | {:network_policy,
                   ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.input()
                   | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.input()})
               | {:skills,
                  list(
                    ExOpenAI.Components.SkillReferenceParam.input()
                    | ExOpenAI.Components.InlineSkillParam.input()
                  )})
              | ExOpenAI.request_option()
      @spec create_container(opts :: [create_container_opt()]) ::
              {:ok, ExOpenAI.Components.ContainerResource.t()} | {:error, any()}
    )

    def create_container(opts \\ []) do
      url = "/containers"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [
          :expires_after,
          :file_ids,
          :memory_limit,
          :name,
          :network_policy,
          :skills
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:expires_after, :file_ids, :memory_limit, :name, :network_policy, :skills]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ContainerResource"}
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
    Delete Container

    Delete a container.

    ## Parameters

    * `:container_id` - **required** - `String.t()`
      The ID of the container to delete.
    """
    (
      @type delete_container_opt() :: ExOpenAI.request_option()
      @spec delete_container(container_id :: String.t(), opts :: [delete_container_opt()]) ::
              {:ok, term()} | {:error, any()}
    )

    def delete_container(container_id, opts \\ []) do
      url = "/containers/{container_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      nil

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
    (
      @type retrieve_container_opt() :: ExOpenAI.request_option()
      @spec retrieve_container(container_id :: String.t(), opts :: [retrieve_container_opt()]) ::
              {:ok, ExOpenAI.Components.ContainerResource.t()} | {:error, any()}
    )

    def retrieve_container(container_id, opts \\ []) do
      url = "/containers/{container_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ContainerResource"}
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
    List Container files

    Lists container files.

    ## Parameters

    * `:container_id` - **required** - `String.t()`

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    (
      @type list_container_files_opt() ::
              (({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
               | {:after, String.t()})
              | ExOpenAI.request_option()
      @spec list_container_files(container_id :: String.t(), opts :: [list_container_files_opt()]) ::
              {:ok, ExOpenAI.Components.ContainerFileListResource.t()} | {:error, any()}
    )

    def list_container_files(container_id, opts \\ []) do
      url = "/containers/{container_id}/files"
      url = String.replace(url, "{container_id}", to_string(container_id))
      query_params = Keyword.take(opts, [:limit, :order, :after])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ContainerFileListResource"
          }
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
    Create a Container File

    You can send either a multipart/form-data request with the raw file content, or a JSON request with a file ID.


    Creates a container file.


    ## Parameters

    * `:container_id` - **required** - `String.t()`

    ## Options

    * `file` - **optional** - `binary() | {String.t(), binary()}`
      The File object (not file name) to be uploaded.
      Format: `binary`

    * `file_id` - **optional** - `String.t()`
      Name of the file to create.
    """
    (
      @type create_container_file_opt() ::
              ({:file, binary() | {String.t(), binary()}} | {:file_id, String.t()})
              | ExOpenAI.request_option()
      @spec create_container_file(
              container_id :: String.t(),
              opts :: [create_container_file_opt()]
            ) :: {:ok, ExOpenAI.Components.ContainerFileResource.t()} | {:error, any()}
    )

    def create_container_file(container_id, opts \\ []) do
      url = "/containers/{container_id}/files"
      url = String.replace(url, "{container_id}", to_string(container_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:file, :file_id])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:file, :file_id] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ContainerFileResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:file], %{})

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
    (
      @type delete_container_file_opt() :: ExOpenAI.request_option()
      @spec delete_container_file(
              container_id :: String.t(),
              file_id :: String.t(),
              opts :: [delete_container_file_opt()]
            ) :: {:ok, term()} | {:error, any()}
    )

    def delete_container_file(container_id, file_id, opts \\ []) do
      url = "/containers/{container_id}/files/{file_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
      url = String.replace(url, "{file_id}", to_string(file_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      nil

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
    (
      @type retrieve_container_file_opt() :: ExOpenAI.request_option()
      @spec retrieve_container_file(
              container_id :: String.t(),
              file_id :: String.t(),
              opts :: [retrieve_container_file_opt()]
            ) :: {:ok, ExOpenAI.Components.ContainerFileResource.t()} | {:error, any()}
    )

    def retrieve_container_file(container_id, file_id, opts \\ []) do
      url = "/containers/{container_id}/files/{file_id}"
      url = String.replace(url, "{container_id}", to_string(container_id))
      url = String.replace(url, "{file_id}", to_string(file_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ContainerFileResource"}
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
    Retrieve Container File Content

    Retrieves a container file content.

    ## Parameters

    * `:container_id` - **required** - `String.t()`

    * `:file_id` - **required** - `String.t()`
    """
    (
      @type retrieve_container_file_content_opt() :: ExOpenAI.request_option()
      @spec retrieve_container_file_content(
              container_id :: String.t(),
              file_id :: String.t(),
              opts :: [retrieve_container_file_content_opt()]
            ) :: {:ok, term()} | {:error, any()}
    )

    def retrieve_container_file_content(container_id, file_id, opts \\ []) do
      url = "/containers/{container_id}/files/{file_id}/content"
      url = String.replace(url, "{container_id}", to_string(container_id))
      url = String.replace(url, "{file_id}", to_string(file_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
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
end
