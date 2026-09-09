defmodule ExOpenAI.Skills do
  @moduledoc """
  Functions for the OpenAI skills API.
  """
  (
    @doc """
    List all skills for the current project.

    ## Options

    * `:limit` - **optional** - `integer()`
      Number of items to retrieve
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `ExOpenAI.Components.OrderEnum.input()`
      Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.

    * `:after` - **optional** - `String.t()`
      Identifier for the last item from the previous pagination request
    """
    (
      @type list_skills_opt() ::
              (({:limit, integer()} | {:order, ExOpenAI.Components.OrderEnum.input()})
               | {:after, String.t()})
              | ExOpenAI.request_option()
      @spec list_skills(opts :: [list_skills_opt()]) ::
              {:ok, ExOpenAI.Components.SkillListResource.t()} | {:error, any()}
    )

    def list_skills(opts \\ []) do
      url = "/skills"
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillListResource"}
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
    Create a new skill.

    ## Options

    * `files` - **optional** - `list(binary() | {String.t(), binary()}) | binary() | {String.t(), binary()}`
    """
    (
      @type create_skill_opt() ::
              {:files,
               list(binary() | {String.t(), binary()}) | binary() | {String.t(), binary()}}
              | ExOpenAI.request_option()
      @spec create_skill(opts :: [create_skill_opt()]) ::
              {:ok, ExOpenAI.Components.SkillResource.t()} | {:error, any()}
    )

    def create_skill(opts \\ []) do
      url = "/skills"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:files])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:files] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:files], %{})

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
    Delete a skill by its ID.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill to delete.
    """
    (
      @type delete_skill_opt() :: ExOpenAI.request_option()
      @spec delete_skill(skill_id :: String.t(), opts :: [delete_skill_opt()]) ::
              {:ok, ExOpenAI.Components.DeletedSkillResource.t()} | {:error, any()}
    )

    def delete_skill(skill_id, opts \\ []) do
      url = "/skills/{skill_id}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeletedSkillResource"}
        )
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
    Get a skill by its ID.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill to retrieve.
    """
    (
      @type get_skill_opt() :: ExOpenAI.request_option()
      @spec get_skill(skill_id :: String.t(), opts :: [get_skill_opt()]) ::
              {:ok, ExOpenAI.Components.SkillResource.t()} | {:error, any()}
    )

    def get_skill(skill_id, opts \\ []) do
      url = "/skills/{skill_id}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillResource"}
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
    Update the default version pointer for a skill.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill.

    ## Options

    * `default_version` - **optional** - `String.t()`
      The skill version number to set as default.
    """
    (
      @type update_skill_default_version_opt() ::
              {:default_version, String.t()} | ExOpenAI.request_option()
      @spec update_skill_default_version(
              skill_id :: String.t(),
              opts :: [update_skill_default_version_opt()]
            ) :: {:ok, ExOpenAI.Components.SkillResource.t()} | {:error, any()}
    )

    def update_skill_default_version(skill_id, opts \\ []) do
      url = "/skills/{skill_id}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:default_version])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:default_version] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillResource"}
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
    Download a skill zip bundle by its ID.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill to download.
    """
    (
      @type get_skill_content_opt() :: ExOpenAI.request_option()
      @spec get_skill_content(skill_id :: String.t(), opts :: [get_skill_content_opt()]) ::
              {:ok, String.t() | binary()} | {:error, any()}
    )

    def get_skill_content(skill_id, opts \\ []) do
      url = "/skills/{skill_id}/content"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      opts = Keyword.put(opts, :response_mode, :raw)
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            one_of: [
              %ExOpenAI.Codegen.DocsParser.Schema{type: "string"},
              %ExOpenAI.Codegen.DocsParser.Schema{type: "string", format: "binary"}
            ]
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
    List skill versions for a skill.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill.

    ## Options

    * `:limit` - **optional** - `integer()`
      Number of versions to retrieve.
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `ExOpenAI.Components.OrderEnum.input()`
      Sort order of results by version number.

    * `:after` - **optional** - `String.t()`
      The skill version ID to start after.
    """
    (
      @type list_skill_versions_opt() ::
              (({:limit, integer()} | {:order, ExOpenAI.Components.OrderEnum.input()})
               | {:after, String.t()})
              | ExOpenAI.request_option()
      @spec list_skill_versions(skill_id :: String.t(), opts :: [list_skill_versions_opt()]) ::
              {:ok, ExOpenAI.Components.SkillVersionListResource.t()} | {:error, any()}
    )

    def list_skill_versions(skill_id, opts \\ []) do
      url = "/skills/{skill_id}/versions"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
            ref: "#/components/schemas/SkillVersionListResource"
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
    Create a new immutable skill version.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill to version.

    ## Options

    * `default` - **optional** - `boolean()`
      Whether to set this version as the default.

    * `files` - **optional** - `list(binary() | {String.t(), binary()}) | binary() | {String.t(), binary()}`
    """
    (
      @type create_skill_version_opt() ::
              ({:default, boolean()}
               | {:files,
                  list(binary() | {String.t(), binary()}) | binary() | {String.t(), binary()}})
              | ExOpenAI.request_option()
      @spec create_skill_version(skill_id :: String.t(), opts :: [create_skill_version_opt()]) ::
              {:ok, ExOpenAI.Components.SkillVersionResource.t()} | {:error, any()}
    )

    def create_skill_version(skill_id, opts \\ []) do
      url = "/skills/{skill_id}/versions"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:default, :files])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:default, :files] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillVersionResource"}
        )
      end

      body_params = ExOpenAI.Client.prepare_multipart(body_params, [:files], %{})

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
    Delete a skill version.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill.

    * `:version` - **required** - `String.t()`
      The skill version number.
    """
    (
      @type delete_skill_version_opt() :: ExOpenAI.request_option()
      @spec delete_skill_version(
              skill_id :: String.t(),
              version :: String.t(),
              opts :: [delete_skill_version_opt()]
            ) :: {:ok, ExOpenAI.Components.DeletedSkillVersionResource.t()} | {:error, any()}
    )

    def delete_skill_version(skill_id, version, opts \\ []) do
      url = "/skills/{skill_id}/versions/{version}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      url = String.replace(url, "{version}", to_string(version))
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
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/DeletedSkillVersionResource"
          }
        )
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
    Get a specific skill version.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill.

    * `:version` - **required** - `String.t()`
      The version number to retrieve.
    """
    (
      @type get_skill_version_opt() :: ExOpenAI.request_option()
      @spec get_skill_version(
              skill_id :: String.t(),
              version :: String.t(),
              opts :: [get_skill_version_opt()]
            ) :: {:ok, ExOpenAI.Components.SkillVersionResource.t()} | {:error, any()}
    )

    def get_skill_version(skill_id, version, opts \\ []) do
      url = "/skills/{skill_id}/versions/{version}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      url = String.replace(url, "{version}", to_string(version))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillVersionResource"}
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
    Download a skill version zip bundle.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`
      The identifier of the skill.

    * `:version` - **required** - `String.t()`
      The skill version number.
    """
    (
      @type get_skill_version_content_opt() :: ExOpenAI.request_option()
      @spec get_skill_version_content(
              skill_id :: String.t(),
              version :: String.t(),
              opts :: [get_skill_version_content_opt()]
            ) :: {:ok, String.t() | binary()} | {:error, any()}
    )

    def get_skill_version_content(skill_id, version, opts \\ []) do
      url = "/skills/{skill_id}/versions/{version}/content"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      url = String.replace(url, "{version}", to_string(version))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      opts = Keyword.put(opts, :response_mode, :raw)
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            one_of: [
              %ExOpenAI.Codegen.DocsParser.Schema{type: "string"},
              %ExOpenAI.Codegen.DocsParser.Schema{type: "string", format: "binary"}
            ]
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
end
