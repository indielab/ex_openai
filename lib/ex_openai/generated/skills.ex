defmodule ExOpenAI.Skills do
  @moduledoc false
  (
    @doc """
    List all skills for the current project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      Number of items to retrieve  
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `any()`  
      Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.

    * `:after` - **optional** - `String.t()`  
      Identifier for the last item from the previous pagination request
    """
    @spec list_skills(opts :: [({:limit, integer()} | {:order, any()}) | {:after, String.t()}]) ::
            {:ok, ExOpenAI.Components.SkillListResource.t()} | {:error, any()}
    def list_skills(opts \\ []) do
      url = "/skills"
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
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillListResource"}
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
    Create a new skill.

    ## Parameters

    * `files` - **required** - `[binary()] | binary()`
    """
    @spec create_skill(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.SkillResource.t()} | {:error, any()}
    def create_skill(opts \\ []) do
      url = "/skills"
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillResource"}
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
    Delete a skill by its ID.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill to delete.
    """
    @spec delete_skill(skill_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeletedSkillResource.t()} | {:error, any()}
    def delete_skill(skill_id, opts \\ []) do
      url = "/skills/{skill_id}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/DeletedSkillResource"}
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
    Get a skill by its ID.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill to retrieve.
    """
    @spec get_skill(skill_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.SkillResource.t()} | {:error, any()}
    def get_skill(skill_id, opts \\ []) do
      url = "/skills/{skill_id}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillResource"}
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
    Update the default version pointer for a skill.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill.

    * `default_version` - **required** - `String.t()`  
      The skill version number to set as default.
    """
    @spec update_skill_default_version(skill_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.SkillResource.t()} | {:error, any()}
    def update_skill_default_version(skill_id, opts \\ []) do
      url = "/skills/{skill_id}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillResource"}
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
    Download a skill zip bundle by its ID.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill to download.
    """
    @spec get_skill_content(skill_id :: String.t(), opts :: keyword()) ::
            {:ok, map()} | {:error, any()}
    def get_skill_content(skill_id, opts \\ []) do
      url = "/skills/{skill_id}/content"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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

    * `:order` - **optional** - `any()`  
      Sort order of results by version number.

    * `:after` - **optional** - `String.t()`  
      The skill version ID to start after.
    """
    @spec list_skill_versions(
            skill_id :: String.t(),
            opts :: [({:limit, integer()} | {:order, any()}) | {:after, String.t()}]
          ) :: {:ok, ExOpenAI.Components.SkillVersionListResource.t()} | {:error, any()}
    def list_skill_versions(skill_id, opts \\ []) do
      url = "/skills/{skill_id}/versions"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
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
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/SkillVersionListResource"
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
    Create a new immutable skill version.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill to version.

    * `files` - **required** - `[binary()] | binary()`

    ## Options

    * `default` - **optional** - `boolean()`  
      Whether to set this version as the default.
    """
    @spec create_skill_version(skill_id :: String.t(), opts :: [default: boolean()]) ::
            {:ok, ExOpenAI.Components.SkillVersionResource.t()} | {:error, any()}
    def create_skill_version(skill_id, opts \\ []) do
      url = "/skills/{skill_id}/versions"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:default])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:default] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillVersionResource"}
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
    Delete a skill version.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill.

    * `:version` - **required** - `String.t()`  
      The skill version number.
    """
    @spec delete_skill_version(skill_id :: String.t(), version :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeletedSkillVersionResource.t()} | {:error, any()}
    def delete_skill_version(skill_id, version, opts \\ []) do
      url = "/skills/{skill_id}/versions/{version}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      url = String.replace(url, "{version}", to_string(version))
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
            ref: "#/components/schemas/DeletedSkillVersionResource"
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
    Get a specific skill version.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill.

    * `:version` - **required** - `String.t()`  
      The version number to retrieve.
    """
    @spec get_skill_version(skill_id :: String.t(), version :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.SkillVersionResource.t()} | {:error, any()}
    def get_skill_version(skill_id, version, opts \\ []) do
      url = "/skills/{skill_id}/versions/{version}"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      url = String.replace(url, "{version}", to_string(version))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/SkillVersionResource"}
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
    Download a skill version zip bundle.

    ## Parameters

    * `:skill_id` - **required** - `String.t()`  
      The identifier of the skill.

    * `:version` - **required** - `String.t()`  
      The skill version number.
    """
    @spec get_skill_version_content(
            skill_id :: String.t(),
            version :: String.t(),
            opts :: keyword()
          ) :: {:ok, map()} | {:error, any()}
    def get_skill_version_content(skill_id, version, opts \\ []) do
      url = "/skills/{skill_id}/versions/{version}/content"
      url = String.replace(url, "{skill_id}", to_string(skill_id))
      url = String.replace(url, "{version}", to_string(version))
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
