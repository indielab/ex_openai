defmodule ExOpenAI.Organization do
  @moduledoc """
  Functions for the OpenAI organization API.
  """
  (
    @doc """
    List organization API keys

    Retrieve a paginated list of organization admin API keys.

    ## Options

    * `:after` - **optional** - `String.t() | nil`

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Allowed values: `"asc"`, `"desc"`
      Default: `"asc"`

    * `:limit` - **optional** - `integer()`
      Default: `20`
    """
    (
      @type admin_api_keys_list_opt() ::
              (({:after, String.t() | nil} | {:order, (:asc | :desc) | String.t()})
               | {:limit, integer()})
              | ExOpenAI.request_option()
      @spec admin_api_keys_list(opts :: [admin_api_keys_list_opt()]) ::
              {:ok, ExOpenAI.Components.ApiKeyList.t()} | {:error, any()}
    )

    def admin_api_keys_list(opts \\ []) do
      url = "/organization/admin_api_keys"
      query_params = Keyword.take(opts, [:after, :order, :limit])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ApiKeyList"}
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
    Create an organization admin API key

    Create a new admin-level API key for the organization.

    ## Parameters

    * `name` - **required** - `String.t()`
      Example: `"New Admin Key"`

    ## Options

    * `expires_in_seconds` - **optional** - `integer()`
      The number of seconds until the API key expires. Omit this field for a key that does not expire.
      Constraints: minimum: 1, maximum: 31536000
      Example: `2592000`
    """
    (
      @type admin_api_keys_create_opt() ::
              {:expires_in_seconds, integer()} | ExOpenAI.request_option()
      @spec admin_api_keys_create(name :: String.t(), opts :: [admin_api_keys_create_opt()]) ::
              {:ok, ExOpenAI.Components.AdminApiKeyCreateResponse.t()} | {:error, any()}
    )

    def admin_api_keys_create(name, opts \\ []) do
      url = "/organization/admin_api_keys"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [:expires_in_seconds])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:expires_in_seconds] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/AdminApiKeyCreateResponse"
          }
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
    Delete an organization admin API key

    Delete the specified admin API key.

    ## Parameters

    * `:key_id` - **required** - `String.t()`
    """
    (
      @type admin_api_keys_delete_opt() :: ExOpenAI.request_option()
      @spec admin_api_keys_delete(key_id :: String.t(), opts :: [admin_api_keys_delete_opt()]) ::
              {:ok,
               %{
                 required(:deleted) => boolean(),
                 required(:id) => String.t(),
                 required(:object) => :"organization.admin_api_key.deleted"
               }}
              | {:error, any()}
    )

    def admin_api_keys_delete(key_id, opts \\ []) do
      url = "/organization/admin_api_keys/{key_id}"
      url = String.replace(url, "{key_id}", to_string(key_id))
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
            type: "object",
            properties: %{
              "deleted" => %ExOpenAI.Codegen.DocsParser.Schema{type: "boolean"},
              "id" => %ExOpenAI.Codegen.DocsParser.Schema{type: "string"},
              "object" => %ExOpenAI.Codegen.DocsParser.Schema{
                type: "string",
                enum: ["organization.admin_api_key.deleted"]
              }
            },
            required: ["id", "object", "deleted"]
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
    Retrieve a single organization API key

    Get details for a specific organization API key by its ID.

    ## Parameters

    * `:key_id` - **required** - `String.t()`
    """
    (
      @type admin_api_keys_get_opt() :: ExOpenAI.request_option()
      @spec admin_api_keys_get(key_id :: String.t(), opts :: [admin_api_keys_get_opt()]) ::
              {:ok, ExOpenAI.Components.AdminApiKey.t()} | {:error, any()}
    )

    def admin_api_keys_get(key_id, opts \\ []) do
      url = "/organization/admin_api_keys/{key_id}"
      url = String.replace(url, "{key_id}", to_string(key_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/AdminApiKey"}
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
    List user actions and configuration changes within this organization.

    ## Options

    * `:effective_at` - **optional** - `%{ optional(:gt) => integer(), optional(:gte) => integer(), optional(:lt) => integer(), optional(:lte) => integer() }`
      Return only events whose `effective_at` (Unix seconds) is in this range.

    * `:project_ids[]` - **optional** - `list(String.t())`
      Return only events for these projects.

    * `:event_types[]` - **optional** - `list(ExOpenAI.Components.AuditLogEventType.input())`
      Return only events with a `type` in one of these values. For example, `project.created`. For all options, see the documentation for the [audit log object](https://platform.openai.com/docs/api-reference/audit-logs/object).

    * `:actor_ids[]` - **optional** - `list(String.t())`
      Return only events performed by these actors. Can be a user ID, a service account ID, or an api key tracking ID.

    * `:actor_emails[]` - **optional** - `list(String.t())`
      Return only events performed by users with these emails.

    * `:resource_ids[]` - **optional** - `list(String.t())`
      Return only events performed on these targets. For example, a project ID updated. For ChatGPT connector role events, use the workspace connector resource ID shown in `details.id`, such as `<workspace_id>__<connector_id>`.

    * `:tenant_only` - **optional** - `boolean()`
      Return only tenant-scoped events associated with this organization. Required for tenant-scoped events such as `role.bound_to_resource` and `role.unbound_from_resource`. When `true`, all supplied event types must be tenant-scoped.
      Default: `false`

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:before` - **optional** - `String.t()`
      A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    """
    (
      @type list_audit_logs_opt() ::
              ((((((((({:effective_at,
                        %{
                          optional(:gt) => integer(),
                          optional(:gte) => integer(),
                          optional(:lt) => integer(),
                          optional(:lte) => integer()
                        }}
                       | {:"project_ids[]", list(String.t())})
                      | {:"event_types[]", list(ExOpenAI.Components.AuditLogEventType.input())})
                     | {:"actor_ids[]", list(String.t())})
                    | {:"actor_emails[]", list(String.t())})
                   | {:"resource_ids[]", list(String.t())})
                  | {:tenant_only, boolean()})
                 | {:limit, integer()})
                | {:after, String.t()})
               | {:before, String.t()})
              | ExOpenAI.request_option()
      @spec list_audit_logs(opts :: [list_audit_logs_opt()]) ::
              {:ok, ExOpenAI.Components.ListAuditLogsResponse.t()} | {:error, any()}
    )

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
          :tenant_only,
          :limit,
          :after,
          :before
        ])

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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
          :"resource_ids[]",
          :tenant_only
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ListAuditLogsResponse"}
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
    List uploaded certificates for this organization.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`
    """
    (
      @type list_organization_certificates_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_organization_certificates(opts :: [list_organization_certificates_opt()]) ::
              {:ok, ExOpenAI.Components.ListCertificatesResponse.t()} | {:error, any()}
    )

    def list_organization_certificates(opts \\ []) do
      url = "/organization/certificates"
      query_params = Keyword.take(opts, [:limit, :after, :order])
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
            ref: "#/components/schemas/ListCertificatesResponse"
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
    Upload a certificate to the organization. This does **not** automatically activate the certificate.

    Organizations can upload up to 50 certificates.


    ## Parameters

    * `certificate` - **required** - `String.t()`
      The certificate content in PEM format

    ## Options

    * `name` - **optional** - `String.t()`
      An optional name for the certificate
    """
    (
      @type upload_certificate_opt() :: {:name, String.t()} | ExOpenAI.request_option()
      @spec upload_certificate(certificate :: String.t(), opts :: [upload_certificate_opt()]) ::
              {:ok, ExOpenAI.Components.Certificate.t()} | {:error, any()}
    )

    def upload_certificate(certificate, opts \\ []) do
      url = "/organization/certificates"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [certificate: certificate]
      optional_body_params = Keyword.take(opts, [:name])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:name] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Certificate"}
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
    Activate certificates at the organization level.

    You can atomically and idempotently activate up to 10 certificates at a time.


    ## Parameters

    * `certificate_ids` - **required** - `list(String.t())`
      Constraints: minItems: 1, maxItems: 10
    """
    (
      @type activate_organization_certificates_opt() :: ExOpenAI.request_option()
      @spec activate_organization_certificates(
              certificate_ids :: list(String.t()),
              opts :: [activate_organization_certificates_opt()]
            ) ::
              {:ok, ExOpenAI.Components.OrganizationCertificateActivationResponse.t()}
              | {:error, any()}
    )

    def activate_organization_certificates(certificate_ids, opts \\ []) do
      url = "/organization/certificates/activate"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationCertificateActivationResponse"
          }
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
    Deactivate certificates at the organization level.

    You can atomically and idempotently deactivate up to 10 certificates at a time.


    ## Parameters

    * `certificate_ids` - **required** - `list(String.t())`
      Constraints: minItems: 1, maxItems: 10
    """
    (
      @type deactivate_organization_certificates_opt() :: ExOpenAI.request_option()
      @spec deactivate_organization_certificates(
              certificate_ids :: list(String.t()),
              opts :: [deactivate_organization_certificates_opt()]
            ) ::
              {:ok, ExOpenAI.Components.OrganizationCertificateDeactivationResponse.t()}
              | {:error, any()}
    )

    def deactivate_organization_certificates(certificate_ids, opts \\ []) do
      url = "/organization/certificates/deactivate"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationCertificateDeactivationResponse"
          }
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
    Delete a certificate from the organization.

    The certificate must be inactive for the organization and all projects.


    ## Parameters

    * `:certificate_id` - **required** - `String.t()`
      Unique ID of the certificate to delete.
    """
    (
      @type delete_certificate_opt() :: ExOpenAI.request_option()
      @spec delete_certificate(certificate_id :: String.t(), opts :: [delete_certificate_opt()]) ::
              {:ok, ExOpenAI.Components.DeleteCertificateResponse.t()} | {:error, any()}
    )

    def delete_certificate(certificate_id, opts \\ []) do
      url = "/organization/certificates/{certificate_id}"
      url = String.replace(url, "{certificate_id}", to_string(certificate_id))
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
            ref: "#/components/schemas/DeleteCertificateResponse"
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
    Get a certificate that has been uploaded to the organization.

    You can get a certificate regardless of whether it is active or not.


    ## Parameters

    * `:certificate_id` - **required** - `String.t()`
      Unique ID of the certificate to retrieve.

    ## Options

    * `:include` - **optional** - `list(:content | String.t())`
      A list of additional fields to include in the response. Currently the only supported value is `content` to fetch the PEM content of the certificate.
    """
    (
      @type get_certificate_opt() ::
              {:include, list(:content | String.t())} | ExOpenAI.request_option()
      @spec get_certificate(certificate_id :: String.t(), opts :: [get_certificate_opt()]) ::
              {:ok, ExOpenAI.Components.Certificate.t()} | {:error, any()}
    )

    def get_certificate(certificate_id, opts \\ []) do
      url = "/organization/certificates/{certificate_id}"
      url = String.replace(url, "{certificate_id}", to_string(certificate_id))
      query_params = Keyword.take(opts, [:include])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:include] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Certificate"}
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
    Modify a certificate. Note that only the name can be modified.


    ## Parameters

    * `:certificate_id` - **required** - `String.t()`
      Unique ID of the certificate to modify.

    ## Options

    * `name` - **optional** - `String.t()`
      The updated name for the certificate
    """
    (
      @type modify_certificate_opt() :: {:name, String.t()} | ExOpenAI.request_option()
      @spec modify_certificate(certificate_id :: String.t(), opts :: [modify_certificate_opt()]) ::
              {:ok, ExOpenAI.Components.Certificate.t()} | {:error, any()}
    )

    def modify_certificate(certificate_id, opts \\ []) do
      url = "/organization/certificates/{certificate_id}"
      url = String.replace(url, "{certificate_id}", to_string(certificate_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:name])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:name] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Certificate"}
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
    Get costs details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1d" | String.t()`
      Width of each time bucket in response. Currently only `1d` is supported, default to `1d`.
      Allowed values: `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only costs for these projects.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only costs for these API keys.

    * `:group_by` - **optional** - `list(:project_id | :line_item | :api_key_id | String.t())`
      Group the costs by the specified fields. Support fields include `project_id`, `line_item`, `api_key_id` and any combination of them.

    * `:limit` - **optional** - `integer()`
      A limit on the number of buckets to be returned. Limit can range between 1 and 180, and the default is 7.
      Default: `7`

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_costs_opt() ::
              ((((((({:start_time, integer()} | {:end_time, integer()})
                    | {:bucket_width, :"1d" | String.t()})
                   | {:project_ids, list(String.t())})
                  | {:api_key_ids, list(String.t())})
                 | {:group_by, list(((:project_id | :line_item) | :api_key_id) | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_costs(opts :: [usage_costs_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

    def usage_costs(opts \\ []) do
      url = "/organization/costs"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :api_key_ids,
          :group_by,
          :limit,
          :page
        ])

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :page,
          :project_ids,
          :start_time
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Retrieves organization data retention controls.
    """
    (
      @type retrieve_organization_data_retention_opt() :: ExOpenAI.request_option()
      @spec retrieve_organization_data_retention(
              opts :: [retrieve_organization_data_retention_opt()]
            ) :: {:ok, ExOpenAI.Components.OrganizationDataRetention.t()} | {:error, any()}
    )

    def retrieve_organization_data_retention(opts \\ []) do
      url = "/organization/data_retention"
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
            ref: "#/components/schemas/OrganizationDataRetention"
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
    Updates organization data retention controls.

    ## Parameters

    * `retention_type` - **required** - `:zero_data_retention | :modified_abuse_monitoring | :enhanced_zero_data_retention | :enhanced_modified_abuse_monitoring | String.t()`
      The desired organization data retention type.
      Allowed values: `"zero_data_retention"`, `"modified_abuse_monitoring"`, `"enhanced_zero_data_retention"`, `"enhanced_modified_abuse_monitoring"`
    """
    (
      @type update_organization_data_retention_opt() :: ExOpenAI.request_option()
      @spec update_organization_data_retention(
              retention_type ::
                (((:zero_data_retention | :modified_abuse_monitoring)
                  | :enhanced_zero_data_retention)
                 | :enhanced_modified_abuse_monitoring)
                | String.t(),
              opts :: [update_organization_data_retention_opt()]
            ) :: {:ok, ExOpenAI.Components.OrganizationDataRetention.t()} | {:error, any()}
    )

    def update_organization_data_retention(retention_type, opts \\ []) do
      url = "/organization/data_retention"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [retention_type: retention_type]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationDataRetention"
          }
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
    Lists all groups in the organization.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of groups to be returned. Limit can range between 0 and 1000, and the default is 100.
      Default: `100`
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is a group ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with group_abc, your subsequent call can include `after=group_abc` in order to fetch the next page of the list.

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Specifies the sort order of the returned groups.
      Allowed values: `"asc"`, `"desc"`
      Default: `"asc"`
    """
    (
      @type list_groups_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_groups(opts :: [list_groups_opt()]) ::
              {:ok, ExOpenAI.Components.GroupListResource.t()} | {:error, any()}
    )

    def list_groups(opts \\ []) do
      url = "/organization/groups"
      query_params = Keyword.take(opts, [:limit, :after, :order])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupListResource"}
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
    Creates a new group in the organization.

    ## Parameters

    * `name` - **required** - `String.t()`
      Human readable name for the group.
      Constraints: minLength: 1, maxLength: 255
    """
    (
      @type create_group_opt() :: ExOpenAI.request_option()
      @spec create_group(name :: String.t(), opts :: [create_group_opt()]) ::
              {:ok, ExOpenAI.Components.GroupResponse.t()} | {:error, any()}
    )

    def create_group(name, opts \\ []) do
      url = "/organization/groups"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupResponse"}
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
    Deletes a group from the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to delete.
    """
    (
      @type delete_group_opt() :: ExOpenAI.request_option()
      @spec delete_group(group_id :: String.t(), opts :: [delete_group_opt()]) ::
              {:ok, ExOpenAI.Components.GroupDeletedResource.t()} | {:error, any()}
    )

    def delete_group(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupDeletedResource"}
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
    Retrieves a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to retrieve.
    """
    (
      @type retrieve_group_opt() :: ExOpenAI.request_option()
      @spec retrieve_group(group_id :: String.t(), opts :: [retrieve_group_opt()]) ::
              {:ok, ExOpenAI.Components.GroupResponse.t()} | {:error, any()}
    )

    def retrieve_group(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupResponse"}
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
    Updates a group's information.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to update.

    * `name` - **required** - `String.t()`
      New display name for the group.
      Constraints: minLength: 1, maxLength: 255
    """
    (
      @type update_group_opt() :: ExOpenAI.request_option()
      @spec update_group(group_id :: String.t(), name :: String.t(), opts :: [update_group_opt()]) ::
              {:ok, ExOpenAI.Components.GroupResourceWithSuccess.t()} | {:error, any()}
    )

    def update_group(group_id, name, opts \\ []) do
      url = "/organization/groups/{group_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/GroupResourceWithSuccess"
          }
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

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order for the returned organization roles.
      Allowed values: `"asc"`, `"desc"`
    """
    (
      @type list_group_role_assignments_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_group_role_assignments(
              group_id :: String.t(),
              opts :: [list_group_role_assignments_opt()]
            ) :: {:ok, ExOpenAI.Components.RoleListResource.t()} | {:error, any()}
    )

    def list_group_role_assignments(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RoleListResource"}
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
    Assigns an organization role to a group within the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group that should receive the organization role.

    * `role_id` - **required** - `String.t()`
      Identifier of the role to assign.
    """
    (
      @type assign_group_role_opt() :: ExOpenAI.request_option()
      @spec assign_group_role(
              group_id :: String.t(),
              role_id :: String.t(),
              opts :: [assign_group_role_opt()]
            ) :: {:ok, ExOpenAI.Components.GroupRoleAssignment.t()} | {:error, any()}
    )

    def assign_group_role(group_id, role_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [role_id: role_id]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupRoleAssignment"}
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
    Unassigns an organization role from a group within the organization.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to modify.

    * `:role_id` - **required** - `String.t()`
      The ID of the organization role to remove from the group.
    """
    (
      @type unassign_group_role_opt() :: ExOpenAI.request_option()
      @spec unassign_group_role(
              group_id :: String.t(),
              role_id :: String.t(),
              opts :: [unassign_group_role_opt()]
            ) :: {:ok, ExOpenAI.Components.DeletedRoleAssignmentResource.t()} | {:error, any()}
    )

    def unassign_group_role(group_id, role_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles/{role_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
            ref: "#/components/schemas/DeletedRoleAssignmentResource"
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
    Retrieves an organization role assigned to a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to inspect.

    * `:role_id` - **required** - `String.t()`
      The ID of the organization role to retrieve for the group.
    """
    (
      @type retrieve_group_role_opt() :: ExOpenAI.request_option()
      @spec retrieve_group_role(
              group_id :: String.t(),
              role_id :: String.t(),
              opts :: [retrieve_group_role_opt()]
            ) :: {:ok, ExOpenAI.Components.AssignedRoleDetails.t()} | {:error, any()}
    )

    def retrieve_group_role(group_id, role_id, opts \\ []) do
      url = "/organization/groups/{group_id}/roles/{role_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/AssignedRoleDetails"}
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

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Specifies the sort order of users in the list.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`
    """
    (
      @type list_group_users_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_group_users(group_id :: String.t(), opts :: [list_group_users_opt()]) ::
              {:ok, ExOpenAI.Components.UserListResource.t()} | {:error, any()}
    )

    def list_group_users(group_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UserListResource"}
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
    Adds a user to a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to update.

    * `user_id` - **required** - `String.t()`
      Identifier of the user to add to the group.
    """
    (
      @type add_group_user_opt() :: ExOpenAI.request_option()
      @spec add_group_user(
              group_id :: String.t(),
              user_id :: String.t(),
              opts :: [add_group_user_opt()]
            ) :: {:ok, ExOpenAI.Components.GroupUserAssignment.t()} | {:error, any()}
    )

    def add_group_user(group_id, user_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users"
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [user_id: user_id]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupUserAssignment"}
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
    Removes a user from a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to update.

    * `:user_id` - **required** - `String.t()`
      The ID of the user to remove from the group.
    """
    (
      @type remove_group_user_opt() :: ExOpenAI.request_option()
      @spec remove_group_user(
              group_id :: String.t(),
              user_id :: String.t(),
              opts :: [remove_group_user_opt()]
            ) :: {:ok, ExOpenAI.Components.GroupUserDeletedResource.t()} | {:error, any()}
    )

    def remove_group_user(group_id, user_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users/{user_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
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
            ref: "#/components/schemas/GroupUserDeletedResource"
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
    Retrieves a user in a group.

    ## Parameters

    * `:group_id` - **required** - `String.t()`
      The ID of the group to inspect.

    * `:user_id` - **required** - `String.t()`
      The ID of the user to retrieve from the group.
    """
    (
      @type retrieve_group_user_opt() :: ExOpenAI.request_option()
      @spec retrieve_group_user(
              group_id :: String.t(),
              user_id :: String.t(),
              opts :: [retrieve_group_user_opt()]
            ) :: {:ok, ExOpenAI.Components.GroupMemberUser.t()} | {:error, any()}
    )

    def retrieve_group_user(group_id, user_id, opts \\ []) do
      url = "/organization/groups/{group_id}/users/{user_id}"
      url = String.replace(url, "{group_id}", to_string(group_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/GroupMemberUser"}
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
    Returns a list of invites in the organization.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    """
    (
      @type list_invites_opt() ::
              ({:limit, integer()} | {:after, String.t()}) | ExOpenAI.request_option()
      @spec list_invites(opts :: [list_invites_opt()]) ::
              {:ok, ExOpenAI.Components.InviteListResponse.t()} | {:error, any()}
    )

    def list_invites(opts \\ []) do
      url = "/organization/invites"
      query_params = Keyword.take(opts, [:limit, :after])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/InviteListResponse"}
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
    Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.

    ## Parameters

    * `email` - **required** - `String.t()`
      Send an email to this address

    * `role` - **required** - `:reader | :owner | String.t()`
      `owner` or `reader`
      Allowed values: `"reader"`, `"owner"`

    ## Options

    * `projects` - **optional** - `list(%{required(:id) => String.t(), required(:role) => :member | :owner | String.t()})`
      An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior. If empty list is passed, the user will not be invited to any projects, including the default one.
    """
    (
      @type invite_user_opt() ::
              {:projects,
               list(%{
                 required(:id) => String.t(),
                 required(:role) => (:member | :owner) | String.t()
               })}
              | ExOpenAI.request_option()
      @spec invite_user(
              email :: String.t(),
              role :: (:reader | :owner) | String.t(),
              opts :: [invite_user_opt()]
            ) :: {:ok, ExOpenAI.Components.Invite.t()} | {:error, any()}
    )

    def invite_user(email, role, opts \\ []) do
      url = "/organization/invites"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [email: email, role: role]
      optional_body_params = Keyword.take(opts, [:projects])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:projects] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Invite"}
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
    Delete an invite. If the invite has already been accepted, it cannot be deleted.

    ## Parameters

    * `:invite_id` - **required** - `String.t()`
      The ID of the invite to delete.
    """
    (
      @type delete_invite_opt() :: ExOpenAI.request_option()
      @spec delete_invite(invite_id :: String.t(), opts :: [delete_invite_opt()]) ::
              {:ok, ExOpenAI.Components.InviteDeleteResponse.t()} | {:error, any()}
    )

    def delete_invite(invite_id, opts \\ []) do
      url = "/organization/invites/{invite_id}"
      url = String.replace(url, "{invite_id}", to_string(invite_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/InviteDeleteResponse"}
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
    Retrieves an invite.

    ## Parameters

    * `:invite_id` - **required** - `String.t()`
      The ID of the invite to retrieve.
    """
    (
      @type retrieve_invite_opt() :: ExOpenAI.request_option()
      @spec retrieve_invite(invite_id :: String.t(), opts :: [retrieve_invite_opt()]) ::
              {:ok, ExOpenAI.Components.Invite.t()} | {:error, any()}
    )

    def retrieve_invite(invite_id, opts \\ []) do
      url = "/organization/invites/{invite_id}"
      url = String.replace(url, "{invite_id}", to_string(invite_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Invite"}
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
    (
      @type list_projects_opt() ::
              (({:limit, integer()} | {:after, String.t()}) | {:include_archived, boolean()})
              | ExOpenAI.request_option()
      @spec list_projects(opts :: [list_projects_opt()]) ::
              {:ok, ExOpenAI.Components.ProjectListResponse.t()} | {:error, any()}
    )

    def list_projects(opts \\ []) do
      url = "/organization/projects"
      query_params = Keyword.take(opts, [:limit, :after, :include_archived])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :include_archived, :limit] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectListResponse"}
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
    Create a new project in the organization. Projects can be created and archived, but cannot be deleted.

    ## Parameters

    * `name` - **required** - `String.t()`
      The friendly name of the project, this name appears in reports.

    ## Options

    * `external_key_id` - **optional** - `String.t() | nil`
      External key ID to associate with the project.

    * `geography` - **optional** - `String.t() | nil`
      Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
    """
    (
      @type create_project_opt() ::
              ({:external_key_id, String.t() | nil} | {:geography, String.t() | nil})
              | ExOpenAI.request_option()
      @spec create_project(name :: String.t(), opts :: [create_project_opt()]) ::
              {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    )

    def create_project(name, opts \\ []) do
      url = "/organization/projects"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [:external_key_id, :geography])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:external_key_id, :geography] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Project"}
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
    Retrieves a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.
    """
    (
      @type retrieve_project_opt() :: ExOpenAI.request_option()
      @spec retrieve_project(project_id :: String.t(), opts :: [retrieve_project_opt()]) ::
              {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    )

    def retrieve_project(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Project"}
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
    Modifies a project in the organization.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    ## Options

    * `external_key_id` - **optional** - `String.t() | nil`
      External key ID to associate with the project.

    * `geography` - **optional** - `String.t() | nil`
      Geography for the project.

    * `name` - **optional** - `String.t() | nil`
      The updated name of the project, this name appears in reports.
    """
    (
      @type modify_project_opt() ::
              (({:external_key_id, String.t() | nil} | {:geography, String.t() | nil})
               | {:name, String.t() | nil})
              | ExOpenAI.request_option()
      @spec modify_project(project_id :: String.t(), opts :: [modify_project_opt()]) ::
              {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    )

    def modify_project(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:external_key_id, :geography, :name])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:external_key_id, :geography, :name] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Project"}
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

    * `:owner_project_access` - **optional** - `:active | :inactive | :any | String.t()`
      Filter API keys by whether the owner currently has effective access to the project. Use `active` for owners with access, `inactive` for owners without access, or `any` for all enabled project API keys. If omitted, the endpoint applies its existing membership-based visibility rules, which may exclude some enabled keys.
      Allowed values: `"active"`, `"inactive"`, `"any"`
    """
    (
      @type list_project_api_keys_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:owner_project_access, ((:active | :inactive) | :any) | String.t()})
              | ExOpenAI.request_option()
      @spec list_project_api_keys(project_id :: String.t(), opts :: [list_project_api_keys_opt()]) ::
              {:ok, ExOpenAI.Components.ProjectApiKeyListResponse.t()} | {:error, any()}
    )

    def list_project_api_keys(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/api_keys"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after, :owner_project_access])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:after, :limit, :owner_project_access] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectApiKeyListResponse"
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
    Deletes an API key from the project.

    Returns confirmation of the key deletion, or an error if the key belonged to
    a service account.


    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:api_key_id` - **required** - `String.t()`
      The ID of the API key.
    """
    (
      @type delete_project_api_key_opt() :: ExOpenAI.request_option()
      @spec delete_project_api_key(
              api_key_id :: String.t(),
              project_id :: String.t(),
              opts :: [delete_project_api_key_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectApiKeyDeleteResponse.t()} | {:error, any()}
    )

    def delete_project_api_key(api_key_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/api_keys/{api_key_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{api_key_id}", to_string(api_key_id))
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
            ref: "#/components/schemas/ProjectApiKeyDeleteResponse"
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
    Retrieves an API key in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:api_key_id` - **required** - `String.t()`
      The ID of the API key.
    """
    (
      @type retrieve_project_api_key_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_api_key(
              api_key_id :: String.t(),
              project_id :: String.t(),
              opts :: [retrieve_project_api_key_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectApiKey.t()} | {:error, any()}
    )

    def retrieve_project_api_key(api_key_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/api_keys/{api_key_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{api_key_id}", to_string(api_key_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectApiKey"}
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
    Archives a project in the organization. Archived projects cannot be used or updated.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.
    """
    (
      @type archive_project_opt() :: ExOpenAI.request_option()
      @spec archive_project(project_id :: String.t(), opts :: [archive_project_opt()]) ::
              {:ok, ExOpenAI.Components.Project.t()} | {:error, any()}
    )

    def archive_project(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/archive"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Project"}
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

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      Allowed values: `"asc"`, `"desc"`
      Default: `"desc"`
    """
    (
      @type list_project_certificates_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_project_certificates(
              project_id :: String.t(),
              opts :: [list_project_certificates_opt()]
            ) :: {:ok, ExOpenAI.Components.ListProjectCertificatesResponse.t()} | {:error, any()}
    )

    def list_project_certificates(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/certificates"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])
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
            ref: "#/components/schemas/ListProjectCertificatesResponse"
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
    Activate certificates at the project level.

    You can atomically and idempotently activate up to 10 certificates at a time.


    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `certificate_ids` - **required** - `list(String.t())`
      Constraints: minItems: 1, maxItems: 10
    """
    (
      @type activate_project_certificates_opt() :: ExOpenAI.request_option()
      @spec activate_project_certificates(
              certificate_ids :: list(String.t()),
              project_id :: String.t(),
              opts :: [activate_project_certificates_opt()]
            ) ::
              {:ok, ExOpenAI.Components.OrganizationProjectCertificateActivationResponse.t()}
              | {:error, any()}
    )

    def activate_project_certificates(certificate_ids, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/certificates/activate"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationProjectCertificateActivationResponse"
          }
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
    Deactivate certificates at the project level. You can atomically and
    idempotently deactivate up to 10 certificates at a time.


    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `certificate_ids` - **required** - `list(String.t())`
      Constraints: minItems: 1, maxItems: 10
    """
    (
      @type deactivate_project_certificates_opt() :: ExOpenAI.request_option()
      @spec deactivate_project_certificates(
              certificate_ids :: list(String.t()),
              project_id :: String.t(),
              opts :: [deactivate_project_certificates_opt()]
            ) ::
              {:ok, ExOpenAI.Components.OrganizationProjectCertificateDeactivationResponse.t()}
              | {:error, any()}
    )

    def deactivate_project_certificates(certificate_ids, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/certificates/deactivate"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [certificate_ids: certificate_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationProjectCertificateDeactivationResponse"
          }
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
    Retrieves project data retention controls.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to inspect.
    """
    (
      @type retrieve_project_data_retention_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_data_retention(
              project_id :: String.t(),
              opts :: [retrieve_project_data_retention_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectDataRetention.t()} | {:error, any()}
    )

    def retrieve_project_data_retention(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/data_retention"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectDataRetention"}
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
    Updates project data retention controls.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to update.

    * `retention_type` - **required** - `:organization_default | :none | :zero_data_retention | :modified_abuse_monitoring | :enhanced_zero_data_retention | :enhanced_modified_abuse_monitoring | String.t()`
      The desired project data retention type.
      Allowed values: `"organization_default"`, `"none"`, `"zero_data_retention"`, `"modified_abuse_monitoring"`, `"enhanced_zero_data_retention"`, `"enhanced_modified_abuse_monitoring"`
    """
    (
      @type update_project_data_retention_opt() :: ExOpenAI.request_option()
      @spec update_project_data_retention(
              project_id :: String.t(),
              retention_type ::
                (((((:organization_default | :none) | :zero_data_retention)
                   | :modified_abuse_monitoring)
                  | :enhanced_zero_data_retention)
                 | :enhanced_modified_abuse_monitoring)
                | String.t(),
              opts :: [update_project_data_retention_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectDataRetention.t()} | {:error, any()}
    )

    def update_project_data_retention(project_id, retention_type, opts \\ []) do
      url = "/organization/projects/{project_id}/data_retention"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [retention_type: retention_type]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectDataRetention"}
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

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order for the returned groups.
      Allowed values: `"asc"`, `"desc"`
      Default: `"asc"`
    """
    (
      @type list_project_groups_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_project_groups(project_id :: String.t(), opts :: [list_project_groups_opt()]) ::
              {:ok, ExOpenAI.Components.ProjectGroupListResource.t()} | {:error, any()}
    )

    def list_project_groups(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/groups"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])
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
            ref: "#/components/schemas/ProjectGroupListResource"
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
    Grants a group access to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to update.

    * `group_id` - **required** - `String.t()`
      Identifier of the group to add to the project.

    * `role` - **required** - `String.t()`
      Identifier of the project role to grant to the group.
    """
    (
      @type add_project_group_opt() :: ExOpenAI.request_option()
      @spec add_project_group(
              group_id :: String.t(),
              project_id :: String.t(),
              role :: String.t(),
              opts :: [add_project_group_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectGroup.t()} | {:error, any()}
    )

    def add_project_group(group_id, project_id, role, opts \\ []) do
      url = "/organization/projects/{project_id}/groups"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [group_id: group_id, role: role]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectGroup"}
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
    Revokes a group's access to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to update.

    * `:group_id` - **required** - `String.t()`
      The ID of the group to remove from the project.
    """
    (
      @type remove_project_group_opt() :: ExOpenAI.request_option()
      @spec remove_project_group(
              group_id :: String.t(),
              project_id :: String.t(),
              opts :: [remove_project_group_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectGroupDeletedResource.t()} | {:error, any()}
    )

    def remove_project_group(group_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/groups/{group_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{group_id}", to_string(group_id))
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
            ref: "#/components/schemas/ProjectGroupDeletedResource"
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
    Retrieves a project's group.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to inspect.

    * `:group_id` - **required** - `String.t()`
      The ID of the group to retrieve.

    ## Options

    * `:group_type` - **optional** - `:group | :tenant_group | String.t()`
      The type of group to retrieve.
      Allowed values: `"group"`, `"tenant_group"`
      Default: `"group"`
    """
    (
      @type retrieve_project_group_opt() ::
              {:group_type, (:group | :tenant_group) | String.t()} | ExOpenAI.request_option()
      @spec retrieve_project_group(
              group_id :: String.t(),
              project_id :: String.t(),
              opts :: [retrieve_project_group_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectGroup.t()} | {:error, any()}
    )

    def retrieve_project_group(group_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/groups/{group_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{group_id}", to_string(group_id))
      query_params = Keyword.take(opts, [:group_type])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:group_type] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectGroup"}
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
    Returns hosted tool permissions for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.
    """
    (
      @type retrieve_project_hosted_tool_permissions_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_hosted_tool_permissions(
              project_id :: String.t(),
              opts :: [retrieve_project_hosted_tool_permissions_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectHostedToolPermissions.t()} | {:error, any()}
    )

    def retrieve_project_hosted_tool_permissions(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/hosted_tool_permissions"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
            ref: "#/components/schemas/ProjectHostedToolPermissions"
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
    Updates hosted tool permissions for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    ## Options

    * `code_interpreter` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil`
      The code interpreter permission update.

    * `file_search` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil`
      The file search permission update.

    * `image_generation` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil`
      The image generation permission update.

    * `mcp` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil`
      The MCP permission update.

    * `web_search` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil`
      The web search permission update.
    """
    (
      @type update_project_hosted_tool_permissions_opt() ::
              (((({:code_interpreter,
                   ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil}
                  | {:file_search, ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil})
                 | {:image_generation,
                    ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil})
                | {:mcp, ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil})
               | {:web_search, ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil})
              | ExOpenAI.request_option()
      @spec update_project_hosted_tool_permissions(
              project_id :: String.t(),
              opts :: [update_project_hosted_tool_permissions_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectHostedToolPermissions.t()} | {:error, any()}
    )

    def update_project_hosted_tool_permissions(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/hosted_tool_permissions"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [:code_interpreter, :file_search, :image_generation, :mcp, :web_search])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:code_interpreter, :file_search, :image_generation, :mcp, :web_search]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectHostedToolPermissions"
          }
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
    Deletes model permissions for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.
    """
    (
      @type delete_project_model_permissions_opt() :: ExOpenAI.request_option()
      @spec delete_project_model_permissions(
              project_id :: String.t(),
              opts :: [delete_project_model_permissions_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ProjectModelPermissionsDeleteResponse.t()}
              | {:error, any()}
    )

    def delete_project_model_permissions(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/model_permissions"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
            ref: "#/components/schemas/ProjectModelPermissionsDeleteResponse"
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
    Returns model permissions for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.
    """
    (
      @type retrieve_project_model_permissions_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_model_permissions(
              project_id :: String.t(),
              opts :: [retrieve_project_model_permissions_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectModelPermissions.t()} | {:error, any()}
    )

    def retrieve_project_model_permissions(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/model_permissions"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectModelPermissions"}
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
    Updates model permissions for a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `mode` - **required** - `:allow_list | :deny_list | String.t()`
      The model permissions mode to apply.
      Allowed values: `"allow_list"`, `"deny_list"`

    * `model_ids` - **required** - `list(String.t())`
      The model IDs included in this permissions policy.
    """
    (
      @type update_project_model_permissions_opt() :: ExOpenAI.request_option()
      @spec update_project_model_permissions(
              mode :: (:allow_list | :deny_list) | String.t(),
              model_ids :: list(String.t()),
              project_id :: String.t(),
              opts :: [update_project_model_permissions_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectModelPermissions.t()} | {:error, any()}
    )

    def update_project_model_permissions(mode, model_ids, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/model_permissions"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [mode: mode, model_ids: model_ids]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectModelPermissions"}
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
    (
      @type list_project_rate_limits_opt() ::
              (({:limit, integer()} | {:after, String.t()}) | {:before, String.t()})
              | ExOpenAI.request_option()
      @spec list_project_rate_limits(
              project_id :: String.t(),
              opts :: [list_project_rate_limits_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectRateLimitListResponse.t()} | {:error, any()}
    )

    def list_project_rate_limits(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/rate_limits"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after, :before])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectRateLimitListResponse"
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
    (
      @type update_project_rate_limits_opt() ::
              ((((({:batch_1_day_max_input_tokens, integer()}
                   | {:max_audio_megabytes_per_1_minute, integer()})
                  | {:max_images_per_1_minute, integer()})
                 | {:max_requests_per_1_day, integer()})
                | {:max_requests_per_1_minute, integer()})
               | {:max_tokens_per_1_minute, integer()})
              | ExOpenAI.request_option()
      @spec update_project_rate_limits(
              project_id :: String.t(),
              rate_limit_id :: String.t(),
              opts :: [update_project_rate_limits_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectRateLimit.t()} | {:error, any()}
    )

    def update_project_rate_limits(project_id, rate_limit_id, opts \\ []) do
      url = "/organization/projects/{project_id}/rate_limits/{rate_limit_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{rate_limit_id}", to_string(rate_limit_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectRateLimit"}
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
    (
      @type list_project_service_accounts_opt() ::
              ({:limit, integer()} | {:after, String.t()}) | ExOpenAI.request_option()
      @spec list_project_service_accounts(
              project_id :: String.t(),
              opts :: [list_project_service_accounts_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ProjectServiceAccountListResponse.t()} | {:error, any()}
    )

    def list_project_service_accounts(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectServiceAccountListResponse"
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
    Creates a new service account in the project. By default, this also returns an unredacted API key for the service account.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `name` - **required** - `String.t()`
      The name of the service account being created.

    ## Options

    * `create_service_account_only` - **optional** - `boolean() | nil`
    """
    (
      @type create_project_service_account_opt() ::
              {:create_service_account_only, boolean() | nil} | ExOpenAI.request_option()
      @spec create_project_service_account(
              name :: String.t(),
              project_id :: String.t(),
              opts :: [create_project_service_account_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ProjectServiceAccountCreateResponse.t()} | {:error, any()}
    )

    def create_project_service_account(name, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [:create_service_account_only])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:create_service_account_only] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectServiceAccountCreateResponse"
          }
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
    Deletes a service account from the project.

    Returns confirmation of service account deletion, or an error if the project
    is archived (archived projects have no service accounts).


    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:service_account_id` - **required** - `String.t()`
      The ID of the service account.
    """
    (
      @type delete_project_service_account_opt() :: ExOpenAI.request_option()
      @spec delete_project_service_account(
              project_id :: String.t(),
              service_account_id :: String.t(),
              opts :: [delete_project_service_account_opt()]
            ) ::
              {:ok, ExOpenAI.Components.ProjectServiceAccountDeleteResponse.t()} | {:error, any()}
    )

    def delete_project_service_account(project_id, service_account_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts/{service_account_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{service_account_id}", to_string(service_account_id))
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
            ref: "#/components/schemas/ProjectServiceAccountDeleteResponse"
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
    Retrieves a service account in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:service_account_id` - **required** - `String.t()`
      The ID of the service account.
    """
    (
      @type retrieve_project_service_account_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_service_account(
              project_id :: String.t(),
              service_account_id :: String.t(),
              opts :: [retrieve_project_service_account_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectServiceAccount.t()} | {:error, any()}
    )

    def retrieve_project_service_account(project_id, service_account_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts/{service_account_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{service_account_id}", to_string(service_account_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectServiceAccount"}
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
    Updates a service account in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:service_account_id` - **required** - `String.t()`
      The ID of the service account.

    ## Options

    * `name` - **optional** - `String.t()`
      The updated service account name.

    * `role` - **optional** - `:member | :owner | String.t()`
      The updated service account role.
      Allowed values: `"member"`, `"owner"`
    """
    (
      @type update_project_service_account_opt() ::
              ({:name, String.t()} | {:role, (:member | :owner) | String.t()})
              | ExOpenAI.request_option()
      @spec update_project_service_account(
              project_id :: String.t(),
              service_account_id :: String.t(),
              opts :: [update_project_service_account_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectServiceAccount.t()} | {:error, any()}
    )

    def update_project_service_account(project_id, service_account_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts/{service_account_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{service_account_id}", to_string(service_account_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:name, :role])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:name, :role] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectServiceAccount"}
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
    Creates an API key for a service account in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:service_account_id` - **required** - `String.t()`
      The ID of the service account.

    ## Options

    * `name` - **optional** - `String.t()`
      API key name.

    * `scopes` - **optional** - `list(String.t())`
      API key scopes.
    """
    (
      @type createan_ap_ikeyforaserviceaccount_opt() ::
              ({:name, String.t()} | {:scopes, list(String.t())}) | ExOpenAI.request_option()
      @spec createan_ap_ikeyforaserviceaccount(
              project_id :: String.t(),
              service_account_id :: String.t(),
              opts :: [createan_ap_ikeyforaserviceaccount_opt()]
            ) :: {:ok, ExOpenAI.Components.ServiceAccountApiKeyBody.t()} | {:error, any()}
    )

    def createan_ap_ikeyforaserviceaccount(project_id, service_account_id, opts \\ []) do
      url = "/organization/projects/{project_id}/service_accounts/{service_account_id}/api_keys"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{service_account_id}", to_string(service_account_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:name, :scopes])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:name, :scopes] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ServiceAccountApiKeyBody"
          }
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
    Lists project spend alerts.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to inspect.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of spend alerts to return. Defaults to 20.
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order for the returned spend alerts.
      Allowed values: `"asc"`, `"desc"`
      Default: `"asc"`

    * `:after` - **optional** - `String.t()`
      Cursor for pagination. Provide the ID of the last spend alert from the previous response to fetch the next page.

    * `:before` - **optional** - `String.t()`
      Cursor for pagination. Provide the ID of the first spend alert from the previous response to fetch the previous page.
    """
    (
      @type list_project_spend_alerts_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:before, String.t()})
              | ExOpenAI.request_option()
      @spec list_project_spend_alerts(
              project_id :: String.t(),
              opts :: [list_project_spend_alerts_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendAlertListResource.t()} | {:error, any()}
    )

    def list_project_spend_alerts(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/spend_alerts"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :order, :after, :before])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectSpendAlertListResource"
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
    Creates a project spend alert.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to update.

    * `currency` - **required** - `:USD | String.t()`
      The currency for the threshold amount.
      Allowed values: `"USD"`

    * `interval` - **required** - `:month | String.t()`
      The time interval for evaluating spend against the threshold.
      Allowed values: `"month"`

    * `notification_channel` - **required** - `ExOpenAI.Components.SpendAlertNotificationChannel.input()`

    * `threshold_amount` - **required** - `integer()`
      The alert threshold amount, in cents.
      Constraints: minimum: 0
    """
    (
      @type create_project_spend_alert_opt() :: ExOpenAI.request_option()
      @spec create_project_spend_alert(
              currency :: :USD | String.t(),
              interval :: :month | String.t(),
              notification_channel :: ExOpenAI.Components.SpendAlertNotificationChannel.input(),
              project_id :: String.t(),
              threshold_amount :: integer(),
              opts :: [create_project_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendAlert.t()} | {:error, any()}
    )

    def create_project_spend_alert(
          currency,
          interval,
          notification_channel,
          project_id,
          threshold_amount,
          opts \\ []
        ) do
      url = "/organization/projects/{project_id}/spend_alerts"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)

      body_params = [
        currency: currency,
        interval: interval,
        notification_channel: notification_channel,
        threshold_amount: threshold_amount
      ]

      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectSpendAlert"}
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
    Deletes a project spend alert.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to update.

    * `:alert_id` - **required** - `String.t()`
      The ID of the spend alert to delete.
    """
    (
      @type delete_project_spend_alert_opt() :: ExOpenAI.request_option()
      @spec delete_project_spend_alert(
              alert_id :: String.t(),
              project_id :: String.t(),
              opts :: [delete_project_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendAlertDeletedResource.t()} | {:error, any()}
    )

    def delete_project_spend_alert(alert_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/spend_alerts/{alert_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{alert_id}", to_string(alert_id))
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
            ref: "#/components/schemas/ProjectSpendAlertDeletedResource"
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
    Retrieves a project spend alert.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:alert_id` - **required** - `String.t()`
      The ID of the spend alert to retrieve.
    """
    (
      @type retrieve_project_spend_alert_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_spend_alert(
              alert_id :: String.t(),
              project_id :: String.t(),
              opts :: [retrieve_project_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendAlert.t()} | {:error, any()}
    )

    def retrieve_project_spend_alert(alert_id, project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/spend_alerts/{alert_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{alert_id}", to_string(alert_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectSpendAlert"}
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
    Updates a project spend alert.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project to update.

    * `:alert_id` - **required** - `String.t()`
      The ID of the spend alert to update.

    * `currency` - **required** - `:USD | String.t()`
      The currency for the threshold amount.
      Allowed values: `"USD"`

    * `interval` - **required** - `:month | String.t()`
      The time interval for evaluating spend against the threshold.
      Allowed values: `"month"`

    * `notification_channel` - **required** - `ExOpenAI.Components.SpendAlertNotificationChannel.input()`

    * `threshold_amount` - **required** - `integer()`
      The alert threshold amount, in cents.
      Constraints: minimum: 0
    """
    (
      @type update_project_spend_alert_opt() :: ExOpenAI.request_option()
      @spec update_project_spend_alert(
              alert_id :: String.t(),
              currency :: :USD | String.t(),
              interval :: :month | String.t(),
              notification_channel :: ExOpenAI.Components.SpendAlertNotificationChannel.input(),
              project_id :: String.t(),
              threshold_amount :: integer(),
              opts :: [update_project_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendAlert.t()} | {:error, any()}
    )

    def update_project_spend_alert(
          alert_id,
          currency,
          interval,
          notification_channel,
          project_id,
          threshold_amount,
          opts \\ []
        ) do
      url = "/organization/projects/{project_id}/spend_alerts/{alert_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{alert_id}", to_string(alert_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)

      body_params = [
        currency: currency,
        interval: interval,
        notification_channel: notification_channel,
        threshold_amount: threshold_amount
      ]

      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectSpendAlert"}
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
    Delete a project's hard spend limit.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project whose hard spend limit is being managed.
    """
    (
      @type deleteprojectspendlimit_opt() :: ExOpenAI.request_option()
      @spec deleteprojectspendlimit(
              project_id :: String.t(),
              opts :: [deleteprojectspendlimit_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendLimitDeletedResource.t()} | {:error, any()}
    )

    def deleteprojectspendlimit(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/spend_limit"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
            ref: "#/components/schemas/ProjectSpendLimitDeletedResource"
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
    Get a project's hard spend limit.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project whose hard spend limit is being managed.
    """
    (
      @type getprojectspendlimit_opt() :: ExOpenAI.request_option()
      @spec getprojectspendlimit(project_id :: String.t(), opts :: [getprojectspendlimit_opt()]) ::
              {:ok, ExOpenAI.Components.ProjectSpendLimitResource.t()} | {:error, any()}
    )

    def getprojectspendlimit(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/spend_limit"
      url = String.replace(url, "{project_id}", to_string(project_id))
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
            ref: "#/components/schemas/ProjectSpendLimitResource"
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
    Create or replace a project's hard spend limit.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project whose hard spend limit is being managed.

    * `currency` - **required** - `:USD | String.t()`
      The currency for the threshold amount. Currently, only `USD` is supported.
      Allowed values: `"USD"`

    * `interval` - **required** - `:month | String.t()`
      The time interval for evaluating spend against the threshold. Currently, only `month` is supported.
      Allowed values: `"month"`

    * `threshold_amount` - **required** - `integer()`
      The hard spend limit amount, in cents.
      Constraints: minimum: 1
    """
    (
      @type updateprojectspendlimit_opt() :: ExOpenAI.request_option()
      @spec updateprojectspendlimit(
              currency :: :USD | String.t(),
              interval :: :month | String.t(),
              project_id :: String.t(),
              threshold_amount :: integer(),
              opts :: [updateprojectspendlimit_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectSpendLimitResource.t()} | {:error, any()}
    )

    def updateprojectspendlimit(currency, interval, project_id, threshold_amount, opts \\ []) do
      url = "/organization/projects/{project_id}/spend_limit"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [currency: currency, interval: interval, threshold_amount: threshold_amount]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/ProjectSpendLimitResource"
          }
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
    (
      @type list_project_users_opt() ::
              ({:limit, integer()} | {:after, String.t()}) | ExOpenAI.request_option()
      @spec list_project_users(project_id :: String.t(), opts :: [list_project_users_opt()]) ::
              {:ok, ExOpenAI.Components.ProjectUserListResponse.t()} | {:error, any()}
    )

    def list_project_users(project_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [:limit, :after])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectUserListResponse"}
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
    Adds a user to the project. Users must already be members of the organization to be added to a project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `role` - **required** - `String.t()`
      `owner` or `member`

    ## Options

    * `email` - **optional** - `String.t() | nil`
      Email of the user to add.

    * `user_id` - **optional** - `String.t() | nil`
      The ID of the user.
    """
    (
      @type create_project_user_opt() ::
              ({:email, String.t() | nil} | {:user_id, String.t() | nil})
              | ExOpenAI.request_option()
      @spec create_project_user(
              project_id :: String.t(),
              role :: String.t(),
              opts :: [create_project_user_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectUser.t()} | {:error, any()}
    )

    def create_project_user(project_id, role, opts \\ []) do
      url = "/organization/projects/{project_id}/users"
      url = String.replace(url, "{project_id}", to_string(project_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [role: role]
      optional_body_params = Keyword.take(opts, [:email, :user_id])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:email, :user_id] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectUser"}
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
    Deletes a user from the project.

    Returns confirmation of project user deletion, or an error if the project is
    archived (archived projects have no users).


    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:user_id` - **required** - `String.t()`
      The ID of the user.
    """
    (
      @type delete_project_user_opt() :: ExOpenAI.request_option()
      @spec delete_project_user(
              project_id :: String.t(),
              user_id :: String.t(),
              opts :: [delete_project_user_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectUserDeleteResponse.t()} | {:error, any()}
    )

    def delete_project_user(project_id, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users/{user_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
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
            ref: "#/components/schemas/ProjectUserDeleteResponse"
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
    Retrieves a user in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:user_id` - **required** - `String.t()`
      The ID of the user.
    """
    (
      @type retrieve_project_user_opt() :: ExOpenAI.request_option()
      @spec retrieve_project_user(
              project_id :: String.t(),
              user_id :: String.t(),
              opts :: [retrieve_project_user_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectUser.t()} | {:error, any()}
    )

    def retrieve_project_user(project_id, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users/{user_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectUser"}
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
    Modifies a user's role in the project.

    ## Parameters

    * `:project_id` - **required** - `String.t()`
      The ID of the project.

    * `:user_id` - **required** - `String.t()`
      The ID of the user.

    ## Options

    * `role` - **optional** - `String.t() | nil`
      `owner` or `member`
    """
    (
      @type modify_project_user_opt() :: {:role, String.t() | nil} | ExOpenAI.request_option()
      @spec modify_project_user(
              project_id :: String.t(),
              user_id :: String.t(),
              opts :: [modify_project_user_opt()]
            ) :: {:ok, ExOpenAI.Components.ProjectUser.t()} | {:error, any()}
    )

    def modify_project_user(project_id, user_id, opts \\ []) do
      url = "/organization/projects/{project_id}/users/{user_id}"
      url = String.replace(url, "{project_id}", to_string(project_id))
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:role])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:role] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/ProjectUser"}
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
    Lists the roles configured for the organization.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of roles to return. Defaults to 1000.
      Default: `1000`
      Constraints: minimum: 0, maximum: 1000

    * `:after` - **optional** - `String.t()`
      Cursor for pagination. Provide the value from the previous response's `next` field to continue listing roles.

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order for the returned roles.
      Allowed values: `"asc"`, `"desc"`
      Default: `"asc"`
    """
    (
      @type list_roles_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_roles(opts :: [list_roles_opt()]) ::
              {:ok, ExOpenAI.Components.PublicRoleListResource.t()} | {:error, any()}
    )

    def list_roles(opts \\ []) do
      url = "/organization/roles"
      query_params = Keyword.take(opts, [:limit, :after, :order])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/PublicRoleListResource"}
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
    Creates a custom role for the organization.

    ## Parameters

    * `permissions` - **required** - `list(String.t())`
      Permissions to grant to the role.

    * `role_name` - **required** - `String.t()`
      Unique name for the role.

    ## Options

    * `description` - **optional** - `String.t() | nil`
      Optional description of the role.
    """
    (
      @type create_role_opt() :: {:description, String.t() | nil} | ExOpenAI.request_option()
      @spec create_role(
              permissions :: list(String.t()),
              role_name :: String.t(),
              opts :: [create_role_opt()]
            ) :: {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    )

    def create_role(permissions, role_name, opts \\ []) do
      url = "/organization/roles"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [permissions: permissions, role_name: role_name]
      optional_body_params = Keyword.take(opts, [:description])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:description] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Role"}
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
    Deletes a custom role from the organization.

    ## Parameters

    * `:role_id` - **required** - `String.t()`
      The ID of the role to delete.
    """
    (
      @type delete_role_opt() :: ExOpenAI.request_option()
      @spec delete_role(role_id :: String.t(), opts :: [delete_role_opt()]) ::
              {:ok, ExOpenAI.Components.RoleDeletedResource.t()} | {:error, any()}
    )

    def delete_role(role_id, opts \\ []) do
      url = "/organization/roles/{role_id}"
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RoleDeletedResource"}
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
    Retrieves an organization role.

    ## Parameters

    * `:role_id` - **required** - `String.t()`
      The ID of the role to retrieve.
    """
    (
      @type retrieve_role_opt() :: ExOpenAI.request_option()
      @spec retrieve_role(role_id :: String.t(), opts :: [retrieve_role_opt()]) ::
              {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    )

    def retrieve_role(role_id, opts \\ []) do
      url = "/organization/roles/{role_id}"
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Role"}
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
    Updates an existing organization role.

    ## Parameters

    * `:role_id` - **required** - `String.t()`
      The ID of the role to update.

    ## Options

    * `description` - **optional** - `String.t() | nil`
      New description for the role.

    * `permissions` - **optional** - `list(String.t()) | nil`
      Updated set of permissions for the role.

    * `role_name` - **optional** - `String.t() | nil`
      New name for the role.
    """
    (
      @type update_role_opt() ::
              (({:description, String.t() | nil} | {:permissions, list(String.t()) | nil})
               | {:role_name, String.t() | nil})
              | ExOpenAI.request_option()
      @spec update_role(role_id :: String.t(), opts :: [update_role_opt()]) ::
              {:ok, ExOpenAI.Components.Role.t()} | {:error, any()}
    )

    def update_role(role_id, opts \\ []) do
      url = "/organization/roles/{role_id}"
      url = String.replace(url, "{role_id}", to_string(role_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [:description, :permissions, :role_name])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:description, :permissions, :role_name] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Role"}
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
    Lists organization spend alerts.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of spend alerts to return. Defaults to 20.
      Constraints: minimum: 0, maximum: 100

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order for the returned spend alerts.
      Allowed values: `"asc"`, `"desc"`
      Default: `"asc"`

    * `:after` - **optional** - `String.t()`
      Cursor for pagination. Provide the ID of the last spend alert from the previous response to fetch the next page.

    * `:before` - **optional** - `String.t()`
      Cursor for pagination. Provide the ID of the first spend alert from the previous response to fetch the previous page.
    """
    (
      @type list_organization_spend_alerts_opt() ::
              ((({:limit, integer()} | {:order, (:asc | :desc) | String.t()})
                | {:after, String.t()})
               | {:before, String.t()})
              | ExOpenAI.request_option()
      @spec list_organization_spend_alerts(opts :: [list_organization_spend_alerts_opt()]) ::
              {:ok, ExOpenAI.Components.OrganizationSpendAlertListResource.t()} | {:error, any()}
    )

    def list_organization_spend_alerts(opts \\ []) do
      url = "/organization/spend_alerts"
      query_params = Keyword.take(opts, [:limit, :order, :after, :before])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :before, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationSpendAlertListResource"
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
    Creates an organization spend alert.

    ## Parameters

    * `currency` - **required** - `:USD | String.t()`
      The currency for the threshold amount.
      Allowed values: `"USD"`

    * `interval` - **required** - `:month | String.t()`
      The time interval for evaluating spend against the threshold.
      Allowed values: `"month"`

    * `notification_channel` - **required** - `ExOpenAI.Components.SpendAlertNotificationChannel.input()`

    * `threshold_amount` - **required** - `integer()`
      The alert threshold amount, in cents.
      Constraints: minimum: 0
    """
    (
      @type create_organization_spend_alert_opt() :: ExOpenAI.request_option()
      @spec create_organization_spend_alert(
              currency :: :USD | String.t(),
              interval :: :month | String.t(),
              notification_channel :: ExOpenAI.Components.SpendAlertNotificationChannel.input(),
              threshold_amount :: integer(),
              opts :: [create_organization_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.OrganizationSpendAlert.t()} | {:error, any()}
    )

    def create_organization_spend_alert(
          currency,
          interval,
          notification_channel,
          threshold_amount,
          opts \\ []
        ) do
      url = "/organization/spend_alerts"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)

      body_params = [
        currency: currency,
        interval: interval,
        notification_channel: notification_channel,
        threshold_amount: threshold_amount
      ]

      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/OrganizationSpendAlert"}
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
    Deletes an organization spend alert.

    ## Parameters

    * `:alert_id` - **required** - `String.t()`
      The ID of the spend alert to delete.
    """
    (
      @type delete_organization_spend_alert_opt() :: ExOpenAI.request_option()
      @spec delete_organization_spend_alert(
              alert_id :: String.t(),
              opts :: [delete_organization_spend_alert_opt()]
            ) ::
              {:ok, ExOpenAI.Components.OrganizationSpendAlertDeletedResource.t()}
              | {:error, any()}
    )

    def delete_organization_spend_alert(alert_id, opts \\ []) do
      url = "/organization/spend_alerts/{alert_id}"
      url = String.replace(url, "{alert_id}", to_string(alert_id))
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
            ref: "#/components/schemas/OrganizationSpendAlertDeletedResource"
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
    Retrieves an organization spend alert.

    ## Parameters

    * `:alert_id` - **required** - `String.t()`
      The ID of the spend alert to retrieve.
    """
    (
      @type retrieve_organization_spend_alert_opt() :: ExOpenAI.request_option()
      @spec retrieve_organization_spend_alert(
              alert_id :: String.t(),
              opts :: [retrieve_organization_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.OrganizationSpendAlert.t()} | {:error, any()}
    )

    def retrieve_organization_spend_alert(alert_id, opts \\ []) do
      url = "/organization/spend_alerts/{alert_id}"
      url = String.replace(url, "{alert_id}", to_string(alert_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/OrganizationSpendAlert"}
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
    Updates an organization spend alert.

    ## Parameters

    * `:alert_id` - **required** - `String.t()`
      The ID of the spend alert to update.

    * `currency` - **required** - `:USD | String.t()`
      The currency for the threshold amount.
      Allowed values: `"USD"`

    * `interval` - **required** - `:month | String.t()`
      The time interval for evaluating spend against the threshold.
      Allowed values: `"month"`

    * `notification_channel` - **required** - `ExOpenAI.Components.SpendAlertNotificationChannel.input()`

    * `threshold_amount` - **required** - `integer()`
      The alert threshold amount, in cents.
      Constraints: minimum: 0
    """
    (
      @type update_organization_spend_alert_opt() :: ExOpenAI.request_option()
      @spec update_organization_spend_alert(
              alert_id :: String.t(),
              currency :: :USD | String.t(),
              interval :: :month | String.t(),
              notification_channel :: ExOpenAI.Components.SpendAlertNotificationChannel.input(),
              threshold_amount :: integer(),
              opts :: [update_organization_spend_alert_opt()]
            ) :: {:ok, ExOpenAI.Components.OrganizationSpendAlert.t()} | {:error, any()}
    )

    def update_organization_spend_alert(
          alert_id,
          currency,
          interval,
          notification_channel,
          threshold_amount,
          opts \\ []
        ) do
      url = "/organization/spend_alerts/{alert_id}"
      url = String.replace(url, "{alert_id}", to_string(alert_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)

      body_params = [
        currency: currency,
        interval: interval,
        notification_channel: notification_channel,
        threshold_amount: threshold_amount
      ]

      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/OrganizationSpendAlert"}
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
    Delete the organization's hard spend limit.
    """
    (
      @type deleteorganizationspendlimit_opt() :: ExOpenAI.request_option()
      @spec deleteorganizationspendlimit(opts :: [deleteorganizationspendlimit_opt()]) ::
              {:ok, ExOpenAI.Components.OrganizationSpendLimitDeletedResource.t()}
              | {:error, any()}
    )

    def deleteorganizationspendlimit(opts \\ []) do
      url = "/organization/spend_limit"
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
            ref: "#/components/schemas/OrganizationSpendLimitDeletedResource"
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
    Get the organization's hard spend limit.
    """
    (
      @type getorganizationspendlimit_opt() :: ExOpenAI.request_option()
      @spec getorganizationspendlimit(opts :: [getorganizationspendlimit_opt()]) ::
              {:ok, ExOpenAI.Components.OrganizationSpendLimitResource.t()} | {:error, any()}
    )

    def getorganizationspendlimit(opts \\ []) do
      url = "/organization/spend_limit"
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
            ref: "#/components/schemas/OrganizationSpendLimitResource"
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
    Create or replace the organization's hard spend limit.

    ## Parameters

    * `currency` - **required** - `:USD | String.t()`
      The currency for the threshold amount. Currently, only `USD` is supported.
      Allowed values: `"USD"`

    * `interval` - **required** - `:month | String.t()`
      The time interval for evaluating spend against the threshold. Currently, only `month` is supported.
      Allowed values: `"month"`

    * `threshold_amount` - **required** - `integer()`
      The hard spend limit amount, in cents.
      Constraints: minimum: 1
    """
    (
      @type updateorganizationspendlimit_opt() :: ExOpenAI.request_option()
      @spec updateorganizationspendlimit(
              currency :: :USD | String.t(),
              interval :: :month | String.t(),
              threshold_amount :: integer(),
              opts :: [updateorganizationspendlimit_opt()]
            ) :: {:ok, ExOpenAI.Components.OrganizationSpendLimitResource.t()} | {:error, any()}
    )

    def updateorganizationspendlimit(currency, interval, threshold_amount, opts \\ []) do
      url = "/organization/spend_limit"
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [currency: currency, interval: interval, threshold_amount: threshold_amount]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/OrganizationSpendLimitResource"
          }
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
    Get audio speeches usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_audio_speeches_opt() ::
              ((((((((({:start_time, integer()} | {:end_time, integer()})
                      | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                     | {:project_ids, list(String.t())})
                    | {:user_ids, list(String.t())})
                   | {:api_key_ids, list(String.t())})
                  | {:models, list(String.t())})
                 | {:group_by,
                    list((((:project_id | :user_id) | :api_key_id) | :model) | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_audio_speeches(opts :: [usage_audio_speeches_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get audio transcriptions usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_audio_transcriptions_opt() ::
              ((((((((({:start_time, integer()} | {:end_time, integer()})
                      | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                     | {:project_ids, list(String.t())})
                    | {:user_ids, list(String.t())})
                   | {:api_key_ids, list(String.t())})
                  | {:models, list(String.t())})
                 | {:group_by,
                    list((((:project_id | :user_id) | :api_key_id) | :model) | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_audio_transcriptions(opts :: [usage_audio_transcriptions_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get code interpreter sessions usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:group_by` - **optional** - `list(:project_id | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_code_interpreter_sessions_opt() ::
              (((((({:start_time, integer()} | {:end_time, integer()})
                   | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                  | {:project_ids, list(String.t())})
                 | {:group_by, list(:project_id | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_code_interpreter_sessions(opts :: [usage_code_interpreter_sessions_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:bucket_width, :end_time, :group_by, :limit, :page, :project_ids, :start_time]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get completions usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:batch` - **optional** - `boolean()`
      If `true`, return batch jobs only. If `false`, return non-batch jobs only. By default, return both.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | :batch | :service_tier | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `batch`, `service_tier` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_completions_opt() ::
              (((((((((({:start_time, integer()} | {:end_time, integer()})
                       | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                      | {:project_ids, list(String.t())})
                     | {:user_ids, list(String.t())})
                    | {:api_key_ids, list(String.t())})
                   | {:models, list(String.t())})
                  | {:batch, boolean()})
                 | {:group_by,
                    list(
                      (((((:project_id | :user_id) | :api_key_id) | :model) | :batch)
                       | :service_tier)
                      | String.t()
                    )})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_completions(opts :: [usage_completions_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get embeddings usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_embeddings_opt() ::
              ((((((((({:start_time, integer()} | {:end_time, integer()})
                      | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                     | {:project_ids, list(String.t())})
                    | {:user_ids, list(String.t())})
                   | {:api_key_ids, list(String.t())})
                  | {:models, list(String.t())})
                 | {:group_by,
                    list((((:project_id | :user_id) | :api_key_id) | :model) | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_embeddings(opts :: [usage_embeddings_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get file search calls usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:vector_store_ids` - **optional** - `list(String.t())`
      Return only usage for these vector stores.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :vector_store_id | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `vector_store_id` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_file_search_calls_opt() ::
              ((((((((({:start_time, integer()} | {:end_time, integer()})
                      | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                     | {:project_ids, list(String.t())})
                    | {:user_ids, list(String.t())})
                   | {:api_key_ids, list(String.t())})
                  | {:vector_store_ids, list(String.t())})
                 | {:group_by,
                    list(
                      (((:project_id | :user_id) | :api_key_id) | :vector_store_id)
                      | String.t()
                    )})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_file_search_calls(opts :: [usage_file_search_calls_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

    def usage_file_search_calls(opts \\ []) do
      url = "/organization/usage/file_search_calls"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :vector_store_ids,
          :group_by,
          :limit,
          :page
        ])

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :end_time,
          :group_by,
          :limit,
          :page,
          :project_ids,
          :start_time,
          :user_ids,
          :vector_store_ids
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get images usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:sources` - **optional** - `list(:"image.generation" | :"image.edit" | :"image.variation" | String.t())`
      Return only usages for these sources. Possible values are `image.generation`, `image.edit`, `image.variation` or any combination of them.

    * `:sizes` - **optional** - `list(:"256x256" | :"512x512" | :"1024x1024" | :"1792x1792" | :"1024x1792" | String.t())`
      Return only usages for these image sizes. Possible values are `256x256`, `512x512`, `1024x1024`, `1792x1792`, `1024x1792` or any combination of them.

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | :size | :source | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `size`, `source` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_images_opt() ::
              ((((((((((({:start_time, integer()} | {:end_time, integer()})
                        | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                       | {:sources,
                          list(
                            ((:"image.generation" | :"image.edit") | :"image.variation")
                            | String.t()
                          )})
                      | {:sizes,
                         list(
                           ((((:"256x256" | :"512x512") | :"1024x1024") | :"1792x1792")
                            | :"1024x1792")
                           | String.t()
                         )})
                     | {:project_ids, list(String.t())})
                    | {:user_ids, list(String.t())})
                   | {:api_key_ids, list(String.t())})
                  | {:models, list(String.t())})
                 | {:group_by,
                    list(
                      (((((:project_id | :user_id) | :api_key_id) | :model) | :size) | :source)
                      | String.t()
                    )})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_images(opts :: [usage_images_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get moderations usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_moderations_opt() ::
              ((((((((({:start_time, integer()} | {:end_time, integer()})
                      | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                     | {:project_ids, list(String.t())})
                    | {:user_ids, list(String.t())})
                   | {:api_key_ids, list(String.t())})
                  | {:models, list(String.t())})
                 | {:group_by,
                    list((((:project_id | :user_id) | :api_key_id) | :model) | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_moderations(opts :: [usage_moderations_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get vector stores usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:group_by` - **optional** - `list(:project_id | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_vector_stores_opt() ::
              (((((({:start_time, integer()} | {:end_time, integer()})
                   | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                  | {:project_ids, list(String.t())})
                 | {:group_by, list(:project_id | String.t())})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_vector_stores(opts :: [usage_vector_stores_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

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

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:bucket_width, :end_time, :group_by, :limit, :page, :project_ids, :start_time]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Get web search calls usage details for the organization.

    ## Options

    * `:start_time` - **optional** - `integer()`
      Start time (Unix seconds) of the query time range, inclusive.

    * `:end_time` - **optional** - `integer()`
      End time (Unix seconds) of the query time range, exclusive.

    * `:bucket_width` - **optional** - `:"1m" | :"1h" | :"1d" | String.t()`
      Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
      Allowed values: `"1m"`, `"1h"`, `"1d"`
      Default: `"1d"`

    * `:project_ids` - **optional** - `list(String.t())`
      Return only usage for these projects.

    * `:user_ids` - **optional** - `list(String.t())`
      Return only usage for these users.

    * `:api_key_ids` - **optional** - `list(String.t())`
      Return only usage for these API keys.

    * `:models` - **optional** - `list(String.t())`
      Return only usage for these models.

    * `:context_levels` - **optional** - `list(:low | :medium | :high | String.t())`
      Return only web search usage for these context levels.

    * `:group_by` - **optional** - `list(:project_id | :user_id | :api_key_id | :model | :context_level | String.t())`
      Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `context_level` or any combination of them.

    * `:limit` - **optional** - `integer()`
      Specifies the number of buckets to return.
    - `bucket_width=1d`: default: 7, max: 31
    - `bucket_width=1h`: default: 24, max: 168
    - `bucket_width=1m`: default: 60, max: 1440

    * `:page` - **optional** - `String.t()`
      A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.
    """
    (
      @type usage_web_search_calls_opt() ::
              (((((((((({:start_time, integer()} | {:end_time, integer()})
                       | {:bucket_width, ((:"1m" | :"1h") | :"1d") | String.t()})
                      | {:project_ids, list(String.t())})
                     | {:user_ids, list(String.t())})
                    | {:api_key_ids, list(String.t())})
                   | {:models, list(String.t())})
                  | {:context_levels, list(((:low | :medium) | :high) | String.t())})
                 | {:group_by,
                    list(
                      ((((:project_id | :user_id) | :api_key_id) | :model) | :context_level)
                      | String.t()
                    )})
                | {:limit, integer()})
               | {:page, String.t()})
              | ExOpenAI.request_option()
      @spec usage_web_search_calls(opts :: [usage_web_search_calls_opt()]) ::
              {:ok, ExOpenAI.Components.UsageResponse.t()} | {:error, any()}
    )

    def usage_web_search_calls(opts \\ []) do
      url = "/organization/usage/web_search_calls"

      query_params =
        Keyword.take(opts, [
          :start_time,
          :end_time,
          :bucket_width,
          :project_ids,
          :user_ids,
          :api_key_ids,
          :models,
          :context_levels,
          :group_by,
          :limit,
          :page
        ])

      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :api_key_ids,
          :bucket_width,
          :context_levels,
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

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UsageResponse"}
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
    Lists all of the users in the organization.

    ## Options

    * `:limit` - **optional** - `integer()`
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      Default: `20`

    * `:after` - **optional** - `String.t()`
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:emails` - **optional** - `list(String.t())`
      Filter by the email address of users.
    """
    (
      @type list_users_opt() ::
              (({:limit, integer()} | {:after, String.t()}) | {:emails, list(String.t())})
              | ExOpenAI.request_option()
      @spec list_users(opts :: [list_users_opt()]) ::
              {:ok, ExOpenAI.Components.UserListResponse.t()} | {:error, any()}
    )

    def list_users(opts \\ []) do
      url = "/organization/users"
      query_params = Keyword.take(opts, [:limit, :after, :emails])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :emails, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UserListResponse"}
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
    Deletes a user from the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`
      The ID of the user.
    """
    (
      @type delete_user_opt() :: ExOpenAI.request_option()
      @spec delete_user(user_id :: String.t(), opts :: [delete_user_opt()]) ::
              {:ok, ExOpenAI.Components.UserDeleteResponse.t()} | {:error, any()}
    )

    def delete_user(user_id, opts \\ []) do
      url = "/organization/users/{user_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UserDeleteResponse"}
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
    Retrieves a user by their identifier.

    ## Parameters

    * `:user_id` - **required** - `String.t()`
      The ID of the user.
    """
    (
      @type retrieve_user_opt() :: ExOpenAI.request_option()
      @spec retrieve_user(user_id :: String.t(), opts :: [retrieve_user_opt()]) ::
              {:ok, ExOpenAI.Components.User.t()} | {:error, any()}
    )

    def retrieve_user(user_id, opts \\ []) do
      url = "/organization/users/{user_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/User"}
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
    Modifies a user's role in the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`
      The ID of the user.

    ## Options

    * `developer_persona` - **optional** - `String.t() | nil`
      Developer persona metadata.

    * `role` - **optional** - `String.t() | nil`
      `owner` or `reader`

    * `role_id` - **optional** - `String.t() | nil`
      Role ID to assign to the user.

    * `technical_level` - **optional** - `String.t() | nil`
      Technical level metadata.
    """
    (
      @type modify_user_opt() ::
              ((({:developer_persona, String.t() | nil} | {:role, String.t() | nil})
                | {:role_id, String.t() | nil})
               | {:technical_level, String.t() | nil})
              | ExOpenAI.request_option()
      @spec modify_user(user_id :: String.t(), opts :: [modify_user_opt()]) ::
              {:ok, ExOpenAI.Components.User.t()} | {:error, any()}
    )

    def modify_user(user_id, opts \\ []) do
      url = "/organization/users/{user_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []

      optional_body_params =
        Keyword.take(opts, [:developer_persona, :role, :role_id, :technical_level])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:developer_persona, :role, :role_id, :technical_level] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/User"}
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

    * `:order` - **optional** - `:asc | :desc | String.t()`
      Sort order for the returned organization roles.
      Allowed values: `"asc"`, `"desc"`
    """
    (
      @type list_user_role_assignments_opt() ::
              (({:limit, integer()} | {:after, String.t()})
               | {:order, (:asc | :desc) | String.t()})
              | ExOpenAI.request_option()
      @spec list_user_role_assignments(
              user_id :: String.t(),
              opts :: [list_user_role_assignments_opt()]
            ) :: {:ok, ExOpenAI.Components.RoleListResource.t()} | {:error, any()}
    )

    def list_user_role_assignments(user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles"
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [:limit, :after, :order])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit, :order] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/RoleListResource"}
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
    Assigns an organization role to a user within the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`
      The ID of the user that should receive the organization role.

    * `role_id` - **required** - `String.t()`
      Identifier of the role to assign.
    """
    (
      @type assign_user_role_opt() :: ExOpenAI.request_option()
      @spec assign_user_role(
              role_id :: String.t(),
              user_id :: String.t(),
              opts :: [assign_user_role_opt()]
            ) :: {:ok, ExOpenAI.Components.UserRoleAssignment.t()} | {:error, any()}
    )

    def assign_user_role(role_id, user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles"
      url = String.replace(url, "{user_id}", to_string(user_id))
      query_params = Keyword.take(opts, [])
      url = ExOpenAI.Query.append(url, query_params)
      body_params = [role_id: role_id]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/UserRoleAssignment"}
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
    Unassigns an organization role from a user within the organization.

    ## Parameters

    * `:user_id` - **required** - `String.t()`
      The ID of the user to modify.

    * `:role_id` - **required** - `String.t()`
      The ID of the organization role to remove from the user.
    """
    (
      @type unassign_user_role_opt() :: ExOpenAI.request_option()
      @spec unassign_user_role(
              role_id :: String.t(),
              user_id :: String.t(),
              opts :: [unassign_user_role_opt()]
            ) :: {:ok, ExOpenAI.Components.DeletedRoleAssignmentResource.t()} | {:error, any()}
    )

    def unassign_user_role(role_id, user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles/{role_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
            ref: "#/components/schemas/DeletedRoleAssignmentResource"
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
    Retrieves an organization role assigned to a user.

    ## Parameters

    * `:user_id` - **required** - `String.t()`
      The ID of the user to inspect.

    * `:role_id` - **required** - `String.t()`
      The ID of the organization role to retrieve for the user.
    """
    (
      @type retrieve_user_role_opt() :: ExOpenAI.request_option()
      @spec retrieve_user_role(
              role_id :: String.t(),
              user_id :: String.t(),
              opts :: [retrieve_user_role_opt()]
            ) :: {:ok, ExOpenAI.Components.AssignedRoleDetails.t()} | {:error, any()}
    )

    def retrieve_user_role(role_id, user_id, opts \\ []) do
      url = "/organization/users/{user_id}/roles/{role_id}"
      url = String.replace(url, "{user_id}", to_string(user_id))
      url = String.replace(url, "{role_id}", to_string(role_id))
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
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/AssignedRoleDetails"}
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
