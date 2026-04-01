defmodule ExOpenAI.Projects do
  @moduledoc false
  (
    @doc """
    Lists the project roles assigned to a group within a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to inspect.

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of project role assignments to return.  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      Cursor for pagination. Provide the value from the previous response's `next` field to continue listing project roles.

    * `:order` - **optional** - `String.t()`  
      Sort order for the returned project roles.  
      Allowed values: `"asc"`, `"desc"`
    """
    @spec list_project_group_role_assignments(
            group_id :: String.t(),
            project_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.RoleListResource.t()} | {:error, any()}
    def list_project_group_role_assignments(group_id, project_id, opts \\ []) do
      url = "/projects/{project_id}/groups/{group_id}/roles"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])

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
          ref: "#/components/schemas/RoleListResource",
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
    Assigns a project role to a group within a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `:group_id` - **required** - `String.t()`  
      The ID of the group that should receive the project role.

    * `role_id` - **required** - `String.t()`  
      Identifier of the role to assign.
    """
    @spec assign_project_group_role(
            group_id :: String.t(),
            project_id :: String.t(),
            role_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.GroupRoleAssignment.t()} | {:error, any()}
    def assign_project_group_role(group_id, project_id, role_id, opts \\ []) do
      url = "/projects/{project_id}/groups/{group_id}/roles"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [role_id: role_id]
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
          ref: "#/components/schemas/GroupRoleAssignment",
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
    Unassigns a project role from a group within a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to modify.

    * `:group_id` - **required** - `String.t()`  
      The ID of the group whose project role assignment should be removed.

    * `:role_id` - **required** - `String.t()`  
      The ID of the project role to remove from the group.
    """
    @spec unassign_project_group_role(
            group_id :: String.t(),
            project_id :: String.t(),
            role_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.DeletedRoleAssignmentResource.t()} | {:error, any()}
    def unassign_project_group_role(group_id, project_id, role_id, opts \\ []) do
      url = "/projects/{project_id}/groups/{group_id}/roles/{role_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{group_id}", to_string(group_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          ref: "#/components/schemas/DeletedRoleAssignmentResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Lists the roles configured for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of roles to return. Defaults to 1000.  
      Default: `1000`  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      Cursor for pagination. Provide the value from the previous response's `next` field to continue listing roles.

    * `:order` - **optional** - `String.t()`  
      Sort order for the returned roles.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`
    """
    @spec list_project_roles(
            project_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.PublicRoleListResource.t()} | {:error, any()}
    def list_project_roles(project_id, opts \\ []) do
      url = "/projects/{project_id}/roles"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])

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
          ref: "#/components/schemas/PublicRoleListResource",
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
    Creates a custom role for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `permissions` - **required** - `[String.t()]`  
      Permissions to grant to the role.

    * `role_name` - **required** - `String.t()`  
      Unique name for the role.

    ## Options

    * `description` - **optional** - `String.t() | any()`  
      Optional description of the role.
    """
    @spec create_project_role(
            permissions :: list(String.t()),
            project_id :: String.t(),
            role_name :: String.t(),
            opts :: [description: String.t() | any()]
          ) :: {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    def create_project_role(permissions, project_id, role_name, opts \\ []) do
      url = "/projects/{project_id}/roles"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [permissions: permissions, role_name: role_name]
      optional_body_params = Keyword.take(opts, [:description])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:description] |> Enum.reject(&(&1 == :stream))
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
          ref: "#/components/schemas/Role",
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
    Deletes a custom role from a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `:role_id` - **required** - `String.t()`  
      The ID of the role to delete.
    """
    @spec delete_project_role(project_id :: String.t(), role_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.RoleDeletedResource.t()} | {:error, any()}
    def delete_project_role(project_id, role_id, opts \\ []) do
      url = "/projects/{project_id}/roles/{role_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          ref: "#/components/schemas/RoleDeletedResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
    Updates an existing project role.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `:role_id` - **required** - `String.t()`  
      The ID of the role to update.

    ## Options

    * `description` - **optional** - `String.t() | any()`  
      New description for the role.

    * `permissions` - **optional** - `[String.t()] | any()`  
      Updated set of permissions for the role.

    * `role_name` - **optional** - `String.t() | any()`  
      New name for the role.
    """
    @spec update_project_role(
            project_id :: String.t(),
            role_id :: String.t(),
            opts :: [
              ({:description, String.t() | any()} | {:permissions, list(String.t()) | any()})
              | {:role_name, String.t() | any()}
            ]
          ) :: {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    def update_project_role(project_id, role_id, opts \\ []) do
      url = "/projects/{project_id}/roles/{role_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:description, :permissions, :role_name])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:description, :permissions, :role_name] |> Enum.reject(&(&1 == :stream))

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
          ref: "#/components/schemas/Role",
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
    Lists the project roles assigned to a user within a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to inspect.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of project role assignments to return.  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      Cursor for pagination. Provide the value from the previous response's `next` field to continue listing project roles.

    * `:order` - **optional** - `String.t()`  
      Sort order for the returned project roles.  
      Allowed values: `"asc"`, `"desc"`
    """
    @spec list_project_user_role_assignments(
            project_id :: String.t(),
            user_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.RoleListResource.t()} | {:error, any()}
    def list_project_user_role_assignments(project_id, user_id, opts \\ []) do
      url = "/projects/{project_id}/users/{user_id}/roles"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])

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
          ref: "#/components/schemas/RoleListResource",
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
    Assigns a project role to a user within a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user that should receive the project role.

    * `role_id` - **required** - `String.t()`  
      Identifier of the role to assign.
    """
    @spec assign_project_user_role(
            project_id :: String.t(),
            role_id :: String.t(),
            user_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.UserRoleAssignment.t()} | {:error, any()}
    def assign_project_user_role(project_id, role_id, user_id, opts \\ []) do
      url = "/projects/{project_id}/users/{user_id}/roles"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [role_id: role_id]
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
          ref: "#/components/schemas/UserRoleAssignment",
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
    Unassigns a project role from a user within a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to modify.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user whose project role assignment should be removed.

    * `:role_id` - **required** - `String.t()`  
      The ID of the project role to remove from the user.
    """
    @spec unassign_project_user_role(
            project_id :: String.t(),
            role_id :: String.t(),
            user_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.DeletedRoleAssignmentResource.t()} | {:error, any()}
    def unassign_project_user_role(project_id, role_id, user_id, opts \\ []) do
      url = "/projects/{project_id}/users/{user_id}/roles/{role_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          ref: "#/components/schemas/DeletedRoleAssignmentResource",
          required: nil,
          type: nil,
          write_only: nil
        })
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
end
