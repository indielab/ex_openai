defmodule ExOpenAI.Organization do
  @moduledoc false
  (
    @doc """
    List organization API keys

    Retrieve a paginated list of organization admin API keys.

    ## Options

    * `:after` - **optional** - `String.t()`

    * `:order` - **optional** - `String.t()`  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`

    * `:limit` - **optional** - `integer()`  
      Default: `20`
    """
    @spec admin_api_keys_list(
            opts :: [({:after, String.t()} | {:order, String.t()}) | {:limit, integer()}]
          ) :: {:ok, ExOpenAI.Components.ApiKeyList.t()} | {:error, any()}
    def admin_api_keys_list(opts \\ []) do
      url = "/organization/admin_api_keys"
      query_params = Keyword.take(opts, [:after, :order, :limit])

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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ApiKeyList",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Create an organization admin API key

    Create a new admin-level API key for the organization.
    """
    @spec admin_api_keys_create(opts :: keyword()) ::
            {:ok, ExOpenAI.Components.AdminApiKey.t()} | {:error, any()}
    def admin_api_keys_create(opts \\ []) do
      url = "/organization/admin_api_keys"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/AdminApiKey",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Delete an organization admin API key

    Delete the specified admin API key.

    ## Parameters

    * `:key_id` - **required** - `String.t()`
    """
    @spec admin_api_keys_delete(key_id :: String.t(), opts :: keyword()) ::
            {:ok, map()} | {:error, any()}
    def admin_api_keys_delete(key_id, opts \\ []) do
      url = "/organization/admin_api_keys/{key_id}"
      url = String.replace(url, "{key_id}", to_string(key_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response -> ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil) end
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
    Retrieve a single organization API key

    Get details for a specific organization API key by its ID.

    ## Parameters

    * `:key_id` - **required** - `String.t()`
    """
    @spec admin_api_keys_get(key_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.AdminApiKey.t()} | {:error, any()}
    def admin_api_keys_get(key_id, opts \\ []) do
      url = "/organization/admin_api_keys/{key_id}"
      url = String.replace(url, "{key_id}", to_string(key_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/AdminApiKey",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    List user actions and configuration changes within this organization.

    ## Options

    * `:effective_at` - **optional** - `any()`  
      Return only events whose `effective_at` (Unix seconds) is in this range.

    * `:project_ids[]` - **optional** - `[String.t()]`  
      Return only events for these projects.

    * `:event_types[]` - **optional** - `any()`  
      Return only events with a `type` in one of these values. For example, `project.created`. For all options, see the documentation for the [audit log object](/docs/api-reference/audit-logs/object).

    * `:actor_ids[]` - **optional** - `[String.t()]`  
      Return only events performed by these actors. Can be a user ID, a service account ID, or an api key tracking ID.

    * `:actor_emails[]` - **optional** - `[String.t()]`  
      Return only events performed by users with these emails.

    * `:resource_ids[]` - **optional** - `[String.t()]`  
      Return only events performed on these targets. For example, a project ID updated.

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`  
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    """
    @spec list_audit_logs(
            opts :: [
              ((((((({:effective_at, any()} | {:"project_ids[]", any()})
                    | {:"event_types[]", any()})
                   | {:"actor_ids[]", any()})
                  | {:"actor_emails[]", any()})
                 | {:"resource_ids[]", any()})
                | {:limit, integer()})
               | {:after, String.t()})
              | {:before, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.ListAuditLogsResponse.t()} | {:error, any()}
    def list_audit_logs(opts \\ []) do
      url = "/organization/audit_logs"

      query_params =
        Keyword.take(opts, [
          :effective_at,
          :"project_ids[]",
          :"event_types[]",
          :"actor_ids[]",
          :"actor_emails[]",
          :"resource_ids[]",
          :limit,
          :after,
          :before
        ])

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
          :"actor_emails[]",
          :"actor_ids[]",
          :after,
          :before,
          :effective_at,
          :"event_types[]",
          :limit,
          :"project_ids[]",
          :"resource_ids[]"
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :"actor_emails[]",
          :"actor_ids[]",
          :after,
          :before,
          :effective_at,
          :"event_types[]",
          :limit,
          :"project_ids[]",
          :"resource_ids[]"
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListAuditLogsResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    List uploaded certificates for this organization.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:order` - **optional** - `String.t()`  
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`
    """
    @spec list_organization_certificates(
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    def list_organization_certificates(opts \\ []) do
      url = "/organization/certificates"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListCertificatesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Upload a certificate to the organization. This does **not** automatically activate the certificate.

    Organizations can upload up to 50 certificates.


    ## Parameters

    * `content` - **required** - `String.t()`  
      The certificate content in PEM format

    ## Options

    * `name` - **optional** - `String.t()`  
      An optional name for the certificate
    """
    @spec upload_certificate(content :: String.t(), opts :: [name: String.t()]) ::
            {:ok, ExOpenAI.Components.Certificate.t()} | {:error, any()}
    def upload_certificate(content, opts \\ []) do
      url = "/organization/certificates"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [content: content]
      optional_body_params = Keyword.take(opts, [:name])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:name] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Certificate",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Activate certificates at the organization level.

    You can atomically and idempotently activate up to 10 certificates at a time.


    ## Parameters

    * `certificate_ids` - **required** - `[String.t()]`  
      Constraints: minItems: 1, maxItems: 10
    """
    @spec activate_organization_certificates(
            certificate_ids :: list(String.t()),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    def activate_organization_certificates(certificate_ids, opts \\ []) do
      url = "/organization/certificates/activate"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListCertificatesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deactivate certificates at the organization level.

    You can atomically and idempotently deactivate up to 10 certificates at a time.


    ## Parameters

    * `certificate_ids` - **required** - `[String.t()]`  
      Constraints: minItems: 1, maxItems: 10
    """
    @spec deactivate_organization_certificates(
            certificate_ids :: list(String.t()),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    def deactivate_organization_certificates(certificate_ids, opts \\ []) do
      url = "/organization/certificates/deactivate"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListCertificatesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Delete a certificate from the organization.

    The certificate must be inactive for the organization and all projects.


    ## Parameters

    * `:certificate_id` - **required** - `String.t()`  
      Unique ID of the certificate to delete.
    """
    @spec delete_certificate(certificate_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeleteCertificateResponse.t()} | {:error, any()}
    def delete_certificate(certificate_id, opts \\ []) do
      url = "/organization/certificates/{certificate_id}"
      url = String.replace(url, "{certificate_id}", to_string(certificate_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/DeleteCertificateResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get a certificate that has been uploaded to the organization.

    You can get a certificate regardless of whether it is active or not.


    ## Parameters

    * `:certificate_id` - **required** - `String.t()`  
      Unique ID of the certificate to retrieve.

    ## Options

    * `:include` - **optional** - `[String.t()]`  
      A list of additional fields to include in the response. Currently the only supported value is `content` to fetch the PEM content of the certificate.
    """
    @spec get_certificate(certificate_id :: String.t(), opts :: [include: any()]) ::
            {:ok, ExOpenAI.Components.Certificate.t()} | {:error, any()}
    def get_certificate(certificate_id, opts \\ []) do
      url = "/organization/certificates/{certificate_id}"
      url = String.replace(url, "{certificate_id}", to_string(certificate_id))
      query_params = Keyword.take(opts, [:include])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:include])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:include] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Certificate",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Modify a certificate. Note that only the name can be modified.


    ## Parameters

    * `:certificate_id` - **required** - `String.t()`  
      Unique ID of the certificate to modify.

    * `name` - **required** - `String.t()`  
      The updated name for the certificate
    """
    @spec modify_certificate(certificate_id :: String.t(), name :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Certificate.t()} | {:error, any()}
    def modify_certificate(certificate_id, name, opts \\ []) do
      url = "/organization/certificates/{certificate_id}"
      url = String.replace(url, "{certificate_id}", to_string(certificate_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Certificate",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get costs details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently only `1d` is supported, default to `1d`.  
      Allowed values: `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only costs for these projects.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the costs by the specified fields. Support fields include `project_id`, `line_item` and any combination of them.

    * `:limit` - **optional** - `integer()`  
      A limit on the number of buckets to be returned. Limit can range between 1 and 180, and the default is 7.  
      Default: `7`

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_costs(
            opts :: [
              ((((({:start_time, integer()} | {:end_time, integer()})
                  | {:bucket_width, String.t()})
                 | {:project_ids, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_costs(opts \\ []) do
      url = "/organization/costs"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :group_by,
          :limit,
          :page
        ])

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
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :page,
          :project_ids,
          :start_time
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:bucket_width, :end_time, :group_by, :limit, :page, :project_ids, :start_time]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Lists all groups in the organization.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of groups to be returned. Limit can range between 0 and 1000, and the default is 100.  
      Default: `100`  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is a group ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with group_abc, your subsequent call can include `after=group_abc` in order to fetch the next page of the list.

    * `:order` - **optional** - `String.t()`  
      Specifies the sort order of the returned groups.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`
    """
    @spec list_groups(
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.GroupListResource.t()} | {:error, any()}
    def list_groups(opts \\ []) do
      url = "/organization/groups"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/GroupListResource",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Creates a new group in the organization.

    ## Parameters

    * `name` - **required** - `String.t()`  
      Human readable name for the group.  
      Constraints: minLength: 1, maxLength: 255
    """
    @spec create_group(name :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.GroupResponse.t()} | {:error, any()}
    def create_group(name, opts \\ []) do
      url = "/organization/groups"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/GroupResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deletes a group from the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to delete.
    """
    @spec delete_group(group_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.GroupDeletedResource.t()} | {:error, any()}
    def delete_group(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/GroupDeletedResource",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Updates a group's information.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to update.

    * `name` - **required** - `String.t()`  
      New display name for the group.  
      Constraints: minLength: 1, maxLength: 255
    """
    @spec update_group(group_id :: String.t(), name :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.GroupResourceWithSuccess.t()} | {:error, any()}
    def update_group(group_id, name, opts \\ []) do
      url = "/organization/groups/{group_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/GroupResourceWithSuccess",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Lists the organization roles assigned to a group within the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group whose organization role assignments you want to list.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of organization role assignments to return.  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      Cursor for pagination. Provide the value from the previous response's `next` field to continue listing organization roles.

    * `:order` - **optional** - `String.t()`  
      Sort order for the returned organization roles.  
      Allowed values: `"asc"`, `"desc"`
    """
    @spec list_group_role_assignments(
            group_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.RoleListResource.t()} | {:error, any()}
    def list_group_role_assignments(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Assigns an organization role to a group within the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group that should receive the organization role.

    * `role_id` - **required** - `String.t()`  
      Identifier of the role to assign.
    """
    @spec assign_group_role(group_id :: String.t(), role_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.GroupRoleAssignment.t()} | {:error, any()}
    def assign_group_role(group_id, role_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Unassigns an organization role from a group within the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to modify.

    * `:role_id` - **required** - `String.t()`  
      The ID of the organization role to remove from the group.
    """
    @spec unassign_group_role(group_id :: String.t(), role_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeletedRoleAssignmentResource.t()} | {:error, any()}
    def unassign_group_role(group_id, role_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles/{role_id}"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Lists the users assigned to a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of users to be returned. Limit can range between 0 and 1000, and the default is 100.  
      Default: `100`  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. Provide the ID of the last user from the previous list response to retrieve the next page.

    * `:order` - **optional** - `String.t()`  
      Specifies the sort order of users in the list.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`
    """
    @spec list_group_users(
            group_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.UserListResource.t()} | {:error, any()}
    def list_group_users(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UserListResource",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Adds a user to a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to update.

    * `user_id` - **required** - `String.t()`  
      Identifier of the user to add to the group.
    """
    @spec add_group_user(group_id :: String.t(), user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.GroupUserAssignment.t()} | {:error, any()}
    def add_group_user(group_id, user_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [user_id: user_id]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/GroupUserAssignment",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Removes a user from a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to update.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user to remove from the group.
    """
    @spec remove_group_user(group_id :: String.t(), user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.GroupUserDeletedResource.t()} | {:error, any()}
    def remove_group_user(group_id, user_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users/{user_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/GroupUserDeletedResource",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Returns a list of invites in the organization.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    @spec list_invites(opts :: [{:limit, integer()} | {:after, String.t()}]) ::
            {:ok, ExOpenAI.Components.InviteListResponse.t()} | {:error, any()}
    def list_invites(opts \\ []) do
      url = "/organization/invites"
      query_params = Keyword.take(opts, [:limit, :after])

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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/InviteListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.

    ## Parameters

    * `email` - **required** - `String.t()`  
      Send an email to this address

    * `role` - **required** - `:reader | :owner`  
      `owner` or `reader`  
      Allowed values: `"reader"`, `"owner"`

    ## Options

    * `projects` - **optional** - `[any()]`  
      An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.
    """
    @spec invite_user(
            email :: String.t(),
            role :: :reader | :owner,
            opts :: [
              projects: list(%{required(:id) => String.t(), required(:role) => :member | :owner})
            ]
          ) :: {:ok, ExOpenAI.Components.Invite.t()} | {:error, any()}
    def invite_user(email, role, opts \\ []) do
      url = "/organization/invites"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [email: email, role: role]
      optional_body_params = Keyword.take(opts, [:projects])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:projects] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Invite",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Delete an invite. If the invite has already been accepted, it cannot be deleted.

    ## Parameters

    * `:invite_id` - **required** - `String.t()`  
      The ID of the invite to delete.
    """
    @spec delete_invite(invite_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.InviteDeleteResponse.t()} | {:error, any()}
    def delete_invite(invite_id, opts \\ []) do
      url = "/organization/invites/{invite_id}"
      url = String.replace(url, "{invite_id}", to_string(invite_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/InviteDeleteResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves an invite.

    ## Parameters

    * `:invite_id` - **required** - `String.t()`  
      The ID of the invite to retrieve.
    """
    @spec retrieve_invite(invite_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Invite.t()} | {:error, any()}
    def retrieve_invite(invite_id, opts \\ []) do
      url = "/organization/invites/{invite_id}"
      url = String.replace(url, "{invite_id}", to_string(invite_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Invite",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Returns a list of projects.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:include_archived` - **optional** - `boolean()`  
      If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.  
      Default: `false`
    """
    @spec list_projects(
            opts :: [
              ({:limit, integer()} | {:after, String.t()}) | {:include_archived, boolean()}
            ]
          ) :: {:ok, ExOpenAI.Components.ProjectListResponse.t()} | {:error, any()}
    def list_projects(opts \\ []) do
      url = "/organization/projects"
      query_params = Keyword.take(opts, [:limit, :after, :include_archived])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :include_archived, :limit])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :include_archived, :limit] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Create a new project in the organization. Projects can be created and archived, but cannot be deleted.

    ## Parameters

    * `name` - **required** - `String.t()`  
      The friendly name of the project, this name appears in reports.

    ## Options

    * `geography` - **optional** - `:US | :EU | :JP | :IN | :KR | :CA | :AU | :SG`  
      Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.  
      Allowed values: `"US"`, `"EU"`, `"JP"`, `"IN"`, `"KR"`, `"CA"`, `"AU"`, `"SG"`
    """
    @spec create_project(
            name :: String.t(),
            opts :: [geography: ((((((:US | :EU) | :JP) | :IN) | :KR) | :CA) | :AU) | :SG]
          ) :: {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    def create_project(name, opts \\ []) do
      url = "/organization/projects"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [:geography])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:geography] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Project",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.
    """
    @spec retrieve_project(project_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    def retrieve_project(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Project",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Modifies a project in the organization.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `name` - **required** - `String.t()`  
      The updated name of the project, this name appears in reports.
    """
    @spec modify_project(name :: String.t(), project_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    def modify_project(name, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Project",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Returns a list of API keys in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    @spec list_project_api_keys(
            project_id :: String.t(),
            opts :: [{:limit, integer()} | {:after, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ProjectApiKeyListResponse.t()} | {:error, any()}
    def list_project_api_keys(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/api_keys"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after])

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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectApiKeyListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deletes an API key from the project.

    Returns confirmation of the key deletion, or an error if the key belonged to
    a service account.


    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:key_id` - **required** - `String.t()`  
      The ID of the API key.
    """
    @spec delete_project_api_key(
            key_id :: String.t(),
            project_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectApiKeyDeleteResponse.t()} | {:error, any()}
    def delete_project_api_key(key_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/api_keys/{key_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{key_id}", to_string(key_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectApiKeyDeleteResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves an API key in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:key_id` - **required** - `String.t()`  
      The ID of the API key.
    """
    @spec retrieve_project_api_key(
            key_id :: String.t(),
            project_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectApiKey.t()} | {:error, any()}
    def retrieve_project_api_key(key_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/api_keys/{key_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{key_id}", to_string(key_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectApiKey",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Archives a project in the organization. Archived projects cannot be used or updated.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.
    """
    @spec archive_project(project_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    def archive_project(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/archive"
      url = String.replace(url, "{project_id}", to_string(project_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/Project",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    List certificates for this project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:order` - **optional** - `String.t()`  
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"desc"`
    """
    @spec list_project_certificates(
            project_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    def list_project_certificates(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/certificates"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListCertificatesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Activate certificates at the project level.

    You can atomically and idempotently activate up to 10 certificates at a time.


    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `certificate_ids` - **required** - `[String.t()]`  
      Constraints: minItems: 1, maxItems: 10
    """
    @spec activate_project_certificates(
            certificate_ids :: list(String.t()),
            project_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    def activate_project_certificates(certificate_ids, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/certificates/activate"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListCertificatesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deactivate certificates at the project level. You can atomically and 
    idempotently deactivate up to 10 certificates at a time.


    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `certificate_ids` - **required** - `[String.t()]`  
      Constraints: minItems: 1, maxItems: 10
    """
    @spec deactivate_project_certificates(
            certificate_ids :: list(String.t()),
            project_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    def deactivate_project_certificates(certificate_ids, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/certificates/deactivate"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ListCertificatesResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Lists the groups that have access to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of project groups to return. Defaults to 20.  
      Default: `20`  
      Constraints: minimum: 0, maximum: 100

    * `:after` - **optional** - `String.t()`  
      Cursor for pagination. Provide the ID of the last group from the previous response to fetch the next page.

    * `:order` - **optional** - `String.t()`  
      Sort order for the returned groups.  
      Allowed values: `"asc"`, `"desc"`  
      Default: `"asc"`
    """
    @spec list_project_groups(
            project_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ProjectGroupListResource.t()} | {:error, any()}
    def list_project_groups(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/groups"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectGroupListResource",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Grants a group access to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `group_id` - **required** - `String.t()`  
      Identifier of the group to add to the project.

    * `role` - **required** - `String.t()`  
      Identifier of the project role to grant to the group.
    """
    @spec add_project_group(
            group_id :: String.t(),
            project_id :: String.t(),
            role :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectGroup.t()} | {:error, any()}
    def add_project_group(group_id, project_id, role, opts \\ []) do
      url = "/organization/projects/{project_id}/groups"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [group_id: group_id, role: role]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectGroup",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Revokes a group's access to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project to update.

    * `:group_id` - **required** - `String.t()`  
      The ID of the group to remove from the project.
    """
    @spec remove_project_group(
            group_id :: String.t(),
            project_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectGroupDeletedResource.t()} | {:error, any()}
    def remove_project_group(group_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/groups/{group_id}"
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
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectGroupDeletedResource",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Returns the rate limits per model for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. The default is 100.  
      Default: `100`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`  
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, beginning with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    """
    @spec list_project_rate_limits(
            project_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:before, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ProjectRateLimitListResponse.t()} | {:error, any()}
    def list_project_rate_limits(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/rate_limits"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after, :before])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :before, :limit])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectRateLimitListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Updates a project rate limit.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:rate_limit_id` - **required** - `String.t()`  
      The ID of the rate limit.

    ## Options

    * `batch_1_day_max_input_tokens` - **optional** - `integer()`  
      The maximum batch input tokens per day. Only relevant for certain models.

    * `max_audio_megabytes_per_1_minute` - **optional** - `integer()`  
      The maximum audio megabytes per minute. Only relevant for certain models.

    * `max_images_per_1_minute` - **optional** - `integer()`  
      The maximum images per minute. Only relevant for certain models.

    * `max_requests_per_1_day` - **optional** - `integer()`  
      The maximum requests per day. Only relevant for certain models.

    * `max_requests_per_1_minute` - **optional** - `integer()`  
      The maximum requests per minute.

    * `max_tokens_per_1_minute` - **optional** - `integer()`  
      The maximum tokens per minute.
    """
    @spec update_project_rate_limits(
            project_id :: String.t(),
            rate_limit_id :: String.t(),
            opts :: [
              (((({:batch_1_day_max_input_tokens, integer()}
                  | {:max_audio_megabytes_per_1_minute, integer()})
                 | {:max_images_per_1_minute, integer()})
                | {:max_requests_per_1_day, integer()})
               | {:max_requests_per_1_minute, integer()})
              | {:max_tokens_per_1_minute, integer()}
            ]
          ) :: {:ok, ExOpenAI.Components.ProjectRateLimit.t()} | {:error, any()}
    def update_project_rate_limits(project_id, rate_limit_id, opts \\ []) do
      url = "/organization/projects/{project_id}/rate_limits/{rate_limit_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{rate_limit_id}", to_string(rate_limit_id))
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
          :batch_1_day_max_input_tokens,
          :max_audio_megabytes_per_1_minute,
          :max_images_per_1_minute,
          :max_requests_per_1_day,
          :max_requests_per_1_minute,
          :max_tokens_per_1_minute
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :batch_1_day_max_input_tokens,
          :max_audio_megabytes_per_1_minute,
          :max_images_per_1_minute,
          :max_requests_per_1_day,
          :max_requests_per_1_minute,
          :max_tokens_per_1_minute
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectRateLimit",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Returns a list of service accounts in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    @spec list_project_service_accounts(
            project_id :: String.t(),
            opts :: [{:limit, integer()} | {:after, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ProjectServiceAccountListResponse.t()} | {:error, any()}
    def list_project_service_accounts(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after])

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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectServiceAccountListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Creates a new service account in the project. This also returns an unredacted API key for the service account.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `name` - **required** - `String.t()`  
      The name of the service account being created.
    """
    @spec create_project_service_account(
            name :: String.t(),
            project_id :: String.t(),
            opts :: keyword()
          ) ::
            {:ok, ExOpenAI.Components.ProjectServiceAccountCreateResponse.t()} | {:error, any()}
    def create_project_service_account(name, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectServiceAccountCreateResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deletes a service account from the project.

    Returns confirmation of service account deletion, or an error if the project
    is archived (archived projects have no service accounts).


    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:service_account_id` - **required** - `String.t()`  
      The ID of the service account.
    """
    @spec delete_project_service_account(
            project_id :: String.t(),
            service_account_id :: String.t(),
            opts :: keyword()
          ) ::
            {:ok, ExOpenAI.Components.ProjectServiceAccountDeleteResponse.t()} | {:error, any()}
    def delete_project_service_account(project_id, service_account_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts/{service_account_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{service_account_id}", to_string(service_account_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectServiceAccountDeleteResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves a service account in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:service_account_id` - **required** - `String.t()`  
      The ID of the service account.
    """
    @spec retrieve_project_service_account(
            project_id :: String.t(),
            service_account_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectServiceAccount.t()} | {:error, any()}
    def retrieve_project_service_account(project_id, service_account_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts/{service_account_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{service_account_id}", to_string(service_account_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectServiceAccount",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Returns a list of users in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    @spec list_project_users(
            project_id :: String.t(),
            opts :: [{:limit, integer()} | {:after, String.t()}]
          ) :: {:ok, ExOpenAI.Components.ProjectUserListResponse.t()} | {:error, any()}
    def list_project_users(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after])

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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectUserListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Adds a user to the project. Users must already be members of the organization to be added to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `role` - **required** - `:owner | :member`  
      `owner` or `member`  
      Allowed values: `"owner"`, `"member"`

    * `user_id` - **required** - `String.t()`  
      The ID of the user.
    """
    @spec create_project_user(
            project_id :: String.t(),
            role :: :owner | :member,
            user_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectUser.t()} | {:error, any()}
    def create_project_user(project_id, role, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [role: role, user_id: user_id]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectUser",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deletes a user from the project.

    Returns confirmation of project user deletion, or an error if the project is
    archived (archived projects have no users).


    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user.
    """
    @spec delete_project_user(project_id :: String.t(), user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.ProjectUserDeleteResponse.t()} | {:error, any()}
    def delete_project_user(project_id, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users/{user_id}"
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
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectUserDeleteResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves a user in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user.
    """
    @spec retrieve_project_user(
            project_id :: String.t(),
            user_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectUser.t()} | {:error, any()}
    def retrieve_project_user(project_id, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users/{user_id}"
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
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectUser",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Modifies a user's role in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`  
      The ID of the project.

    * `:user_id` - **required** - `String.t()`  
      The ID of the user.

    * `role` - **required** - `:owner | :member`  
      `owner` or `member`  
      Allowed values: `"owner"`, `"member"`
    """
    @spec modify_project_user(
            project_id :: String.t(),
            role :: :owner | :member,
            user_id :: String.t(),
            opts :: keyword()
          ) :: {:ok, ExOpenAI.Components.ProjectUser.t()} | {:error, any()}
    def modify_project_user(project_id, role, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users/{user_id}"
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
      body_params = [role: role]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/ProjectUser",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Lists the roles configured for the organization.

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
    @spec list_roles(
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.PublicRoleListResource.t()} | {:error, any()}
    def list_roles(opts \\ []) do
      url = "/organization/roles"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Creates a custom role for the organization.

    ## Parameters

    * `permissions` - **required** - `[String.t()]`  
      Permissions to grant to the role.

    * `role_name` - **required** - `String.t()`  
      Unique name for the role.

    ## Options

    * `description` - **optional** - `String.t() | any()`  
      Optional description of the role.
    """
    @spec create_role(
            permissions :: list(String.t()),
            role_name :: String.t(),
            opts :: [description: String.t() | any()]
          ) :: {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    def create_role(permissions, role_name, opts \\ []) do
      url = "/organization/roles"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Deletes a custom role from the organization.

    ## Parameters

    * `:role_id` - **required** - `String.t()`  
      The ID of the role to delete.
    """
    @spec delete_role(role_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.RoleDeletedResource.t()} | {:error, any()}
    def delete_role(role_id, opts \\ []) do
      url = "/organization/roles/{role_id}"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Updates an existing organization role.

    ## Parameters

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
    @spec update_role(
            role_id :: String.t(),
            opts :: [
              ({:description, String.t() | any()} | {:permissions, list(String.t()) | any()})
              | {:role_name, String.t() | any()}
            ]
          ) :: {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    def update_role(role_id, opts \\ []) do
      url = "/organization/roles/{role_id}"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Get audio speeches usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:user_ids` - **optional** - `[String.t()]`  
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `[String.t()]`  
      Return only usage for these API keys.

    * `:models` - **optional** - `[String.t()]`  
      Return only usage for these models.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_audio_speeches(
            opts :: [
              (((((((({:start_time, integer()} | {:end_time, integer()})
                     | {:bucket_width, String.t()})
                    | {:project_ids, any()})
                   | {:user_ids, any()})
                  | {:api_key_ids, any()})
                 | {:models, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_audio_speeches(opts \\ []) do
      url = "/organization/usage/audio_speeches"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :group_by,
          :limit,
          :page
        ])

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
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get audio transcriptions usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:user_ids` - **optional** - `[String.t()]`  
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `[String.t()]`  
      Return only usage for these API keys.

    * `:models` - **optional** - `[String.t()]`  
      Return only usage for these models.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_audio_transcriptions(
            opts :: [
              (((((((({:start_time, integer()} | {:end_time, integer()})
                     | {:bucket_width, String.t()})
                    | {:project_ids, any()})
                   | {:user_ids, any()})
                  | {:api_key_ids, any()})
                 | {:models, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_audio_transcriptions(opts \\ []) do
      url = "/organization/usage/audio_transcriptions"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :group_by,
          :limit,
          :page
        ])

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
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get code interpreter sessions usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_code_interpreter_sessions(
            opts :: [
              ((((({:start_time, integer()} | {:end_time, integer()})
                  | {:bucket_width, String.t()})
                 | {:project_ids, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_code_interpreter_sessions(opts \\ []) do
      url = "/organization/usage/code_interpreter_sessions"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :group_by,
          :limit,
          :page
        ])

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
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :page,
          :project_ids,
          :start_time
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:bucket_width, :end_time, :group_by, :limit, :page, :project_ids, :start_time]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get completions usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:user_ids` - **optional** - `[String.t()]`  
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `[String.t()]`  
      Return only usage for these API keys.

    * `:models` - **optional** - `[String.t()]`  
      Return only usage for these models.

    * `:batch` - **optional** - `boolean()`  
      If `true`, return batch jobs only. If `false`, return non-batch jobs only. By default, return both.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `batch`, `service_tier` or any combination of them.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_completions(
            opts :: [
              ((((((((({:start_time, integer()} | {:end_time, integer()})
                      | {:bucket_width, String.t()})
                     | {:project_ids, any()})
                    | {:user_ids, any()})
                   | {:api_key_ids, any()})
                  | {:models, any()})
                 | {:batch, boolean()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_completions(opts \\ []) do
      url = "/organization/usage/completions"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :batch,
          :group_by,
          :limit,
          :page
        ])

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
          :api_key_ids,
          :batch,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :batch,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get embeddings usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:user_ids` - **optional** - `[String.t()]`  
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `[String.t()]`  
      Return only usage for these API keys.

    * `:models` - **optional** - `[String.t()]`  
      Return only usage for these models.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_embeddings(
            opts :: [
              (((((((({:start_time, integer()} | {:end_time, integer()})
                     | {:bucket_width, String.t()})
                    | {:project_ids, any()})
                   | {:user_ids, any()})
                  | {:api_key_ids, any()})
                 | {:models, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_embeddings(opts \\ []) do
      url = "/organization/usage/embeddings"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :group_by,
          :limit,
          :page
        ])

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
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get images usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:sources` - **optional** - `[String.t()]`  
      Return only usages for these sources. Possible values are `image.generation`, `image.edit`, `image.variation` or any combination of them.

    * `:sizes` - **optional** - `[String.t()]`  
      Return only usages for these image sizes. Possible values are `256x256`, `512x512`, `1024x1024`, `1792x1792`, `1024x1792` or any combination of them.

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:user_ids` - **optional** - `[String.t()]`  
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `[String.t()]`  
      Return only usage for these API keys.

    * `:models` - **optional** - `[String.t()]`  
      Return only usage for these models.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `size`, `source` or any combination of them.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_images(
            opts :: [
              (((((((((({:start_time, integer()} | {:end_time, integer()})
                       | {:bucket_width, String.t()})
                      | {:sources, any()})
                     | {:sizes, any()})
                    | {:project_ids, any()})
                   | {:user_ids, any()})
                  | {:api_key_ids, any()})
                 | {:models, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_images(opts \\ []) do
      url = "/organization/usage/images"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :sources,
          :sizes,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :group_by,
          :limit,
          :page
        ])

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
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :sizes,
          :sources,
          :start_time,
          :user_ids
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :sizes,
          :sources,
          :start_time,
          :user_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get moderations usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:user_ids` - **optional** - `[String.t()]`  
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `[String.t()]`  
      Return only usage for these API keys.

    * `:models` - **optional** - `[String.t()]`  
      Return only usage for these models.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_moderations(
            opts :: [
              (((((((({:start_time, integer()} | {:end_time, integer()})
                     | {:bucket_width, String.t()})
                    | {:project_ids, any()})
                   | {:user_ids, any()})
                  | {:api_key_ids, any()})
                 | {:models, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_moderations(opts \\ []) do
      url = "/organization/usage/moderations"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :group_by,
          :limit,
          :page
        ])

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
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :models,
          :page,
          :project_ids,
          :start_time,
          :user_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Get vector stores usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`  
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`  
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `String.t()`  
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.  
      Allowed values: `"1m"`, `"1h"`, `"1d"`  
      Default: `"1d"`

    * `:project_ids` - **optional** - `[String.t()]`  
      Return only usage for these projects.

    * `:group_by` - **optional** - `[String.t()]`  
      Group the usage data by the specified fields. Support fields include `project_id`.

    * `:limit` - **optional** - `integer()`  
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`  
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    @spec usage_vector_stores(
            opts :: [
              ((((({:start_time, integer()} | {:end_time, integer()})
                  | {:bucket_width, String.t()})
                 | {:project_ids, any()})
                | {:group_by, any()})
               | {:limit, integer()})
              | {:page, String.t()}
            ]
          ) :: {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    def usage_vector_stores(opts \\ []) do
      url = "/organization/usage/vector_stores"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :group_by,
          :limit,
          :page
        ])

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
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :page,
          :project_ids,
          :start_time
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:bucket_width, :end_time, :group_by, :limit, :page, :project_ids, :start_time]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UsageResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Lists all of the users in the organization.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:emails` - **optional** - `[String.t()]`  
      Filter by the email address of users.
    """
    @spec list_users(opts :: [({:limit, integer()} | {:after, String.t()}) | {:emails, any()}]) ::
            {:ok, ExOpenAI.Components.UserListResponse.t()} | {:error, any()}
    def list_users(opts \\ []) do
      url = "/organization/users"
      query_params = Keyword.take(opts, [:limit, :after, :emails])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :emails, :limit])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :emails, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UserListResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Deletes a user from the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`  
      The ID of the user.
    """
    @spec delete_user(user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.UserDeleteResponse.t()} | {:error, any()}
    def delete_user(user_id, opts \\ []) do
      url = "/organization/users/{user_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/UserDeleteResponse",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Retrieves a user by their identifier.

    ## Parameters

    * `:user_id` - **required** - `String.t()`  
      The ID of the user.
    """
    @spec retrieve_user(user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.User.t()} | {:error, any()}
    def retrieve_user(user_id, opts \\ []) do
      url = "/organization/users/{user_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/User",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Modifies a user's role in the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`  
      The ID of the user.

    * `role` - **required** - `:owner | :reader`  
      `owner` or `reader`  
      Allowed values: `"owner"`, `"reader"`
    """
    @spec modify_user(role :: :owner | :reader, user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.User.t()} | {:error, any()}
    def modify_user(role, user_id, opts \\ []) do
      url = "/organization/users/{user_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [role: role]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
              ref: "#/components/schemas/User",
              required: nil,
              type: nil,
              write_only: nil
            })
          end
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
    Lists the organization roles assigned to a user within the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`  
      The ID of the user to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`  
      A limit on the number of organization role assignments to return.  
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`  
      Cursor for pagination. Provide the value from the previous response's `next` field to continue listing organization roles.

    * `:order` - **optional** - `String.t()`  
      Sort order for the returned organization roles.  
      Allowed values: `"asc"`, `"desc"`
    """
    @spec list_user_role_assignments(
            user_id :: String.t(),
            opts :: [({:limit, integer()} | {:after, String.t()}) | {:order, String.t()}]
          ) :: {:ok, ExOpenAI.Components.RoleListResource.t()} | {:error, any()}
    def list_user_role_assignments(user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Assigns an organization role to a user within the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`  
      The ID of the user that should receive the organization role.

    * `role_id` - **required** - `String.t()`  
      Identifier of the role to assign.
    """
    @spec assign_user_role(role_id :: String.t(), user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.UserRoleAssignment.t()} | {:error, any()}
    def assign_user_role(role_id, user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
    Unassigns an organization role from a user within the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`  
      The ID of the user to modify.

    * `:role_id` - **required** - `String.t()`  
      The ID of the organization role to remove from the user.
    """
    @spec unassign_user_role(role_id :: String.t(), user_id :: String.t(), opts :: keyword()) ::
            {:ok, ExOpenAI.Components.DeletedRoleAssignmentResource.t()} | {:error, any()}
    def unassign_user_role(role_id, user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles/{role_id}"
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

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn
            {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
            other -> other
          end
        else
          fn response ->
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
