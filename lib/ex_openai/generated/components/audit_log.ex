defmodule ExOpenAI.Components.AuditLog do
  use ExOpenAI.Jason

  @moduledoc """
  A log of a user action or configuration change within this organization.

  ## Fields

  * `:actor` - **optional** - `ExOpenAI.Components.AuditLogActor.t() | nil`

  * `:api_key.created` - **optional** - `%{optional(:data) => %{optional(:scopes) => list(String.t())}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:api_key.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:api_key.updated` - **optional** - `%{ optional(:changes_requested) => %{optional(:scopes) => list(String.t())}, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:certificate.created` - **optional** - `%{optional(:id) => String.t(), optional(:name) => String.t()}`
    The details for events with this `type`.

  * `:certificate.deleted` - **optional** - `%{ optional(:certificate) => String.t(), optional(:id) => String.t(), optional(:name) => String.t() }`
    The details for events with this `type`.

  * `:certificate.updated` - **optional** - `%{optional(:id) => String.t(), optional(:name) => String.t()}`
    The details for events with this `type`.

  * `:certificates.activated` - **optional** - `%{optional(:certificates) => list(%{optional(:id) => String.t(), optional(:name) => String.t()})}`
    The details for events with this `type`.

  * `:certificates.deactivated` - **optional** - `%{optional(:certificates) => list(%{optional(:id) => String.t(), optional(:name) => String.t()})}`
    The details for events with this `type`.

  * `:checkpoint.permission.created` - **optional** - `%{ optional(:data) => %{ optional(:fine_tuned_model_checkpoint) => String.t(), optional(:project_id) => String.t() }, optional(:id) => String.t() }`
    The project and fine-tuned model checkpoint that the checkpoint permission was created for.

  * `:checkpoint.permission.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:effective_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of the event.
    Format: `unixtime`

  * `:external_key.registered` - **optional** - `%{optional(:data) => map(), optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:external_key.removed` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:group.created` - **optional** - `%{optional(:data) => %{optional(:group_name) => String.t()}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:group.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:group.updated` - **optional** - `%{ optional(:changes_requested) => %{optional(:group_name) => String.t()}, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:id` - **required** - `String.t()`
    The ID of this log.

  * `:invite.accepted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:invite.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:invite.sent` - **optional** - `%{ optional(:data) => %{optional(:email) => String.t(), optional(:role) => String.t()}, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:ip_allowlist.config.activated` - **optional** - `%{optional(:configs) => list(%{optional(:id) => String.t(), optional(:name) => String.t()})}`
    The details for events with this `type`.

  * `:ip_allowlist.config.deactivated` - **optional** - `%{optional(:configs) => list(%{optional(:id) => String.t(), optional(:name) => String.t()})}`
    The details for events with this `type`.

  * `:ip_allowlist.created` - **optional** - `%{ optional(:allowed_ips) => list(String.t()), optional(:id) => String.t(), optional(:name) => String.t() }`
    The details for events with this `type`.

  * `:ip_allowlist.deleted` - **optional** - `%{ optional(:allowed_ips) => list(String.t()), optional(:id) => String.t(), optional(:name) => String.t() }`
    The details for events with this `type`.

  * `:ip_allowlist.updated` - **optional** - `%{optional(:allowed_ips) => list(String.t()), optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:login.failed` - **optional** - `%{optional(:error_code) => String.t(), optional(:error_message) => String.t()}`
    The details for events with this `type`.

  * `:login.succeeded` - **optional** - `map()`
    This event has no additional fields beyond the standard audit log attributes.

  * `:logout.failed` - **optional** - `%{optional(:error_code) => String.t(), optional(:error_message) => String.t()}`
    The details for events with this `type`.

  * `:logout.succeeded` - **optional** - `map()`
    This event has no additional fields beyond the standard audit log attributes.

  * `:organization.updated` - **optional** - `%{ optional(:changes_requested) => %{ optional(:api_call_logging) => String.t(), optional(:api_call_logging_project_ids) => String.t(), optional(:description) => String.t(), optional(:name) => String.t(), optional(:threads_ui_visibility) => String.t(), optional(:title) => String.t(), optional(:usage_dashboard_visibility) => String.t() }, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:project` - **optional** - `%{optional(:id) => String.t(), optional(:name) => String.t()}`
    The project that the action was scoped to. Absent for actions not scoped to projects. Note that any admin actions taken via Admin API keys are associated with the default project.

  * `:project.archived` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:project.created` - **optional** - `%{ optional(:data) => %{optional(:name) => String.t(), optional(:title) => String.t()}, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:project.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:project.updated` - **optional** - `%{optional(:changes_requested) => %{optional(:title) => String.t()}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:rate_limit.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:rate_limit.updated` - **optional** - `%{ optional(:changes_requested) => %{ optional(:batch_1_day_max_input_tokens) => integer(), optional(:max_audio_megabytes_per_1_minute) => integer(), optional(:max_images_per_1_minute) => integer(), optional(:max_requests_per_1_day) => integer(), optional(:max_requests_per_1_minute) => integer(), optional(:max_tokens_per_1_minute) => integer() }, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:role.assignment.created` - **optional** - `%{ optional(:id) => String.t(), optional(:principal_id) => String.t(), optional(:principal_type) => String.t(), optional(:resource_id) => String.t(), optional(:resource_type) => String.t() }`
    The details for events with this `type`.

  * `:role.assignment.deleted` - **optional** - `%{ optional(:id) => String.t(), optional(:principal_id) => String.t(), optional(:principal_type) => String.t(), optional(:resource_id) => String.t(), optional(:resource_type) => String.t() }`
    The details for events with this `type`.

  * `:role.bound_to_resource` - **optional** - `%{ optional(:connector_id) => String.t(), optional(:connector_name) => String.t(), optional(:enabled) => boolean(), optional(:id) => String.t(), optional(:permissions) => list(String.t()), optional(:resource_id) => String.t(), optional(:resource_type) => String.t(), optional(:role_id) => String.t(), optional(:source) => :role_toggle | :role_connector_update | :role_delete | :workspace_permissions | :connector_publish, optional(:workspace_id) => String.t() }`
    The details for events with this `type`.

  * `:role.created` - **optional** - `%{ optional(:id) => String.t(), optional(:permissions) => list(String.t()), optional(:resource_id) => String.t(), optional(:resource_type) => String.t(), optional(:role_name) => String.t() }`
    The details for events with this `type`.

  * `:role.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:role.unbound_from_resource` - **optional** - `%{ optional(:connector_id) => String.t(), optional(:connector_name) => String.t(), optional(:enabled) => boolean(), optional(:id) => String.t(), optional(:permissions) => list(String.t()), optional(:resource_id) => String.t(), optional(:resource_type) => String.t(), optional(:role_id) => String.t(), optional(:source) => :role_toggle | :role_connector_update | :role_delete | :workspace_permissions | :connector_publish, optional(:workspace_id) => String.t() }`
    The details for events with this `type`.

  * `:role.updated` - **optional** - `%{ optional(:changes_requested) => %{ optional(:description) => String.t(), optional(:metadata) => map(), optional(:permissions_added) => list(String.t()), optional(:permissions_removed) => list(String.t()), optional(:resource_id) => String.t(), optional(:resource_type) => String.t(), optional(:role_name) => String.t() }, optional(:id) => String.t() }`
    The details for events with this `type`.

  * `:scim.disabled` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:scim.enabled` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:service_account.created` - **optional** - `%{optional(:data) => %{optional(:role) => String.t()}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:service_account.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:service_account.updated` - **optional** - `%{optional(:changes_requested) => %{optional(:role) => String.t()}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:type` - **required** - `ExOpenAI.Components.AuditLogEventType.t()`

  * `:user.added` - **optional** - `%{optional(:data) => %{optional(:role) => String.t()}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:user.deleted` - **optional** - `%{optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:user.updated` - **optional** - `%{optional(:changes_requested) => %{optional(:role) => String.t()}, optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:workload_identity_provider.created` - **optional** - `%{optional(:data) => map(), optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:workload_identity_provider.deleted` - **optional** - `%{optional(:id) => String.t(), optional(:name) => String.t()}`
    The details for events with this `type`.

  * `:workload_identity_provider.updated` - **optional** - `%{optional(:changes_requested) => map(), optional(:id) => String.t()}`
    The details for events with this `type`.

  * `:workload_identity_provider_mapping.created` - **optional** - `%{ optional(:data) => map(), optional(:id) => String.t(), optional(:identity_provider_id) => String.t() }`
    The details for events with this `type`.

  * `:workload_identity_provider_mapping.deleted` - **optional** - `%{ optional(:id) => String.t(), optional(:identity_provider_id) => String.t(), optional(:project_id) => String.t(), optional(:service_account_id) => String.t() }`
    The details for events with this `type`.

  * `:workload_identity_provider_mapping.updated` - **optional** - `%{ optional(:changes_requested) => map(), optional(:id) => String.t(), optional(:identity_provider_id) => String.t() }`
    The details for events with this `type`.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          actor: (ExOpenAI.Components.AuditLogActor.t() | nil) | nil,
          "api_key.created":
            %{
              optional(:data) => %{optional(:scopes) => list(String.t())},
              optional(:id) => String.t()
            }
            | nil,
          "api_key.deleted": %{optional(:id) => String.t()} | nil,
          "api_key.updated":
            %{
              optional(:changes_requested) => %{optional(:scopes) => list(String.t())},
              optional(:id) => String.t()
            }
            | nil,
          "certificate.created":
            %{optional(:id) => String.t(), optional(:name) => String.t()} | nil,
          "certificate.deleted":
            %{
              optional(:certificate) => String.t(),
              optional(:id) => String.t(),
              optional(:name) => String.t()
            }
            | nil,
          "certificate.updated":
            %{optional(:id) => String.t(), optional(:name) => String.t()} | nil,
          "certificates.activated":
            %{
              optional(:certificates) =>
                list(%{optional(:id) => String.t(), optional(:name) => String.t()})
            }
            | nil,
          "certificates.deactivated":
            %{
              optional(:certificates) =>
                list(%{optional(:id) => String.t(), optional(:name) => String.t()})
            }
            | nil,
          "checkpoint.permission.created":
            %{
              optional(:data) => %{
                optional(:fine_tuned_model_checkpoint) => String.t(),
                optional(:project_id) => String.t()
              },
              optional(:id) => String.t()
            }
            | nil,
          "checkpoint.permission.deleted": %{optional(:id) => String.t()} | nil,
          effective_at: integer(),
          "external_key.registered":
            %{optional(:data) => map(), optional(:id) => String.t()} | nil,
          "external_key.removed": %{optional(:id) => String.t()} | nil,
          "group.created":
            %{
              optional(:data) => %{optional(:group_name) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          "group.deleted": %{optional(:id) => String.t()} | nil,
          "group.updated":
            %{
              optional(:changes_requested) => %{optional(:group_name) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          id: String.t(),
          "invite.accepted": %{optional(:id) => String.t()} | nil,
          "invite.deleted": %{optional(:id) => String.t()} | nil,
          "invite.sent":
            %{
              optional(:data) => %{optional(:email) => String.t(), optional(:role) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          "ip_allowlist.config.activated":
            %{
              optional(:configs) =>
                list(%{optional(:id) => String.t(), optional(:name) => String.t()})
            }
            | nil,
          "ip_allowlist.config.deactivated":
            %{
              optional(:configs) =>
                list(%{optional(:id) => String.t(), optional(:name) => String.t()})
            }
            | nil,
          "ip_allowlist.created":
            %{
              optional(:allowed_ips) => list(String.t()),
              optional(:id) => String.t(),
              optional(:name) => String.t()
            }
            | nil,
          "ip_allowlist.deleted":
            %{
              optional(:allowed_ips) => list(String.t()),
              optional(:id) => String.t(),
              optional(:name) => String.t()
            }
            | nil,
          "ip_allowlist.updated":
            %{optional(:allowed_ips) => list(String.t()), optional(:id) => String.t()} | nil,
          "login.failed":
            %{optional(:error_code) => String.t(), optional(:error_message) => String.t()} | nil,
          "login.succeeded": map() | nil,
          "logout.failed":
            %{optional(:error_code) => String.t(), optional(:error_message) => String.t()} | nil,
          "logout.succeeded": map() | nil,
          "organization.updated":
            %{
              optional(:changes_requested) => %{
                optional(:api_call_logging) => String.t(),
                optional(:api_call_logging_project_ids) => String.t(),
                optional(:description) => String.t(),
                optional(:name) => String.t(),
                optional(:threads_ui_visibility) => String.t(),
                optional(:title) => String.t(),
                optional(:usage_dashboard_visibility) => String.t()
              },
              optional(:id) => String.t()
            }
            | nil,
          project: %{optional(:id) => String.t(), optional(:name) => String.t()} | nil,
          "project.archived": %{optional(:id) => String.t()} | nil,
          "project.created":
            %{
              optional(:data) => %{optional(:name) => String.t(), optional(:title) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          "project.deleted": %{optional(:id) => String.t()} | nil,
          "project.updated":
            %{
              optional(:changes_requested) => %{optional(:title) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          "rate_limit.deleted": %{optional(:id) => String.t()} | nil,
          "rate_limit.updated":
            %{
              optional(:changes_requested) => %{
                optional(:batch_1_day_max_input_tokens) => integer(),
                optional(:max_audio_megabytes_per_1_minute) => integer(),
                optional(:max_images_per_1_minute) => integer(),
                optional(:max_requests_per_1_day) => integer(),
                optional(:max_requests_per_1_minute) => integer(),
                optional(:max_tokens_per_1_minute) => integer()
              },
              optional(:id) => String.t()
            }
            | nil,
          "role.assignment.created":
            %{
              optional(:id) => String.t(),
              optional(:principal_id) => String.t(),
              optional(:principal_type) => String.t(),
              optional(:resource_id) => String.t(),
              optional(:resource_type) => String.t()
            }
            | nil,
          "role.assignment.deleted":
            %{
              optional(:id) => String.t(),
              optional(:principal_id) => String.t(),
              optional(:principal_type) => String.t(),
              optional(:resource_id) => String.t(),
              optional(:resource_type) => String.t()
            }
            | nil,
          "role.bound_to_resource":
            %{
              optional(:connector_id) => String.t(),
              optional(:connector_name) => String.t(),
              optional(:enabled) => boolean(),
              optional(:id) => String.t(),
              optional(:permissions) => list(String.t()),
              optional(:resource_id) => String.t(),
              optional(:resource_type) => String.t(),
              optional(:role_id) => String.t(),
              optional(:source) =>
                (((:role_toggle | :role_connector_update) | :role_delete)
                 | :workspace_permissions)
                | :connector_publish,
              optional(:workspace_id) => String.t()
            }
            | nil,
          "role.created":
            %{
              optional(:id) => String.t(),
              optional(:permissions) => list(String.t()),
              optional(:resource_id) => String.t(),
              optional(:resource_type) => String.t(),
              optional(:role_name) => String.t()
            }
            | nil,
          "role.deleted": %{optional(:id) => String.t()} | nil,
          "role.unbound_from_resource":
            %{
              optional(:connector_id) => String.t(),
              optional(:connector_name) => String.t(),
              optional(:enabled) => boolean(),
              optional(:id) => String.t(),
              optional(:permissions) => list(String.t()),
              optional(:resource_id) => String.t(),
              optional(:resource_type) => String.t(),
              optional(:role_id) => String.t(),
              optional(:source) =>
                (((:role_toggle | :role_connector_update) | :role_delete)
                 | :workspace_permissions)
                | :connector_publish,
              optional(:workspace_id) => String.t()
            }
            | nil,
          "role.updated":
            %{
              optional(:changes_requested) => %{
                optional(:description) => String.t(),
                optional(:metadata) => map(),
                optional(:permissions_added) => list(String.t()),
                optional(:permissions_removed) => list(String.t()),
                optional(:resource_id) => String.t(),
                optional(:resource_type) => String.t(),
                optional(:role_name) => String.t()
              },
              optional(:id) => String.t()
            }
            | nil,
          "scim.disabled": %{optional(:id) => String.t()} | nil,
          "scim.enabled": %{optional(:id) => String.t()} | nil,
          "service_account.created":
            %{optional(:data) => %{optional(:role) => String.t()}, optional(:id) => String.t()}
            | nil,
          "service_account.deleted": %{optional(:id) => String.t()} | nil,
          "service_account.updated":
            %{
              optional(:changes_requested) => %{optional(:role) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          type: ExOpenAI.Components.AuditLogEventType.t(),
          "user.added":
            %{optional(:data) => %{optional(:role) => String.t()}, optional(:id) => String.t()}
            | nil,
          "user.deleted": %{optional(:id) => String.t()} | nil,
          "user.updated":
            %{
              optional(:changes_requested) => %{optional(:role) => String.t()},
              optional(:id) => String.t()
            }
            | nil,
          "workload_identity_provider.created":
            %{optional(:data) => map(), optional(:id) => String.t()} | nil,
          "workload_identity_provider.deleted":
            %{optional(:id) => String.t(), optional(:name) => String.t()} | nil,
          "workload_identity_provider.updated":
            %{optional(:changes_requested) => map(), optional(:id) => String.t()} | nil,
          "workload_identity_provider_mapping.created":
            %{
              optional(:data) => map(),
              optional(:id) => String.t(),
              optional(:identity_provider_id) => String.t()
            }
            | nil,
          "workload_identity_provider_mapping.deleted":
            %{
              optional(:id) => String.t(),
              optional(:identity_provider_id) => String.t(),
              optional(:project_id) => String.t(),
              optional(:service_account_id) => String.t()
            }
            | nil,
          "workload_identity_provider_mapping.updated":
            %{
              optional(:changes_requested) => map(),
              optional(:id) => String.t(),
              optional(:identity_provider_id) => String.t()
            }
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:actor) => ExOpenAI.Components.AuditLogActor.input() | nil,
              optional(:"api_key.created") => %{
                optional(:data) => %{optional(:scopes) => list(String.t())},
                optional(:id) => String.t()
              },
              optional(:"api_key.deleted") => %{optional(:id) => String.t()},
              optional(:"api_key.updated") => %{
                optional(:changes_requested) => %{optional(:scopes) => list(String.t())},
                optional(:id) => String.t()
              },
              optional(:"certificate.created") => %{
                optional(:id) => String.t(),
                optional(:name) => String.t()
              },
              optional(:"certificate.deleted") => %{
                optional(:certificate) => String.t(),
                optional(:id) => String.t(),
                optional(:name) => String.t()
              },
              optional(:"certificate.updated") => %{
                optional(:id) => String.t(),
                optional(:name) => String.t()
              },
              optional(:"certificates.activated") => %{
                optional(:certificates) =>
                  list(%{optional(:id) => String.t(), optional(:name) => String.t()})
              },
              optional(:"certificates.deactivated") => %{
                optional(:certificates) =>
                  list(%{optional(:id) => String.t(), optional(:name) => String.t()})
              },
              optional(:"checkpoint.permission.created") => %{
                optional(:data) => %{
                  optional(:fine_tuned_model_checkpoint) => String.t(),
                  optional(:project_id) => String.t()
                },
                optional(:id) => String.t()
              },
              optional(:"checkpoint.permission.deleted") => %{optional(:id) => String.t()},
              required(:effective_at) => integer(),
              optional(:"external_key.registered") => %{
                optional(:data) => map(),
                optional(:id) => String.t()
              },
              optional(:"external_key.removed") => %{optional(:id) => String.t()},
              optional(:"group.created") => %{
                optional(:data) => %{optional(:group_name) => String.t()},
                optional(:id) => String.t()
              },
              optional(:"group.deleted") => %{optional(:id) => String.t()},
              optional(:"group.updated") => %{
                optional(:changes_requested) => %{optional(:group_name) => String.t()},
                optional(:id) => String.t()
              },
              required(:id) => String.t(),
              optional(:"invite.accepted") => %{optional(:id) => String.t()},
              optional(:"invite.deleted") => %{optional(:id) => String.t()},
              optional(:"invite.sent") => %{
                optional(:data) => %{
                  optional(:email) => String.t(),
                  optional(:role) => String.t()
                },
                optional(:id) => String.t()
              },
              optional(:"ip_allowlist.config.activated") => %{
                optional(:configs) =>
                  list(%{optional(:id) => String.t(), optional(:name) => String.t()})
              },
              optional(:"ip_allowlist.config.deactivated") => %{
                optional(:configs) =>
                  list(%{optional(:id) => String.t(), optional(:name) => String.t()})
              },
              optional(:"ip_allowlist.created") => %{
                optional(:allowed_ips) => list(String.t()),
                optional(:id) => String.t(),
                optional(:name) => String.t()
              },
              optional(:"ip_allowlist.deleted") => %{
                optional(:allowed_ips) => list(String.t()),
                optional(:id) => String.t(),
                optional(:name) => String.t()
              },
              optional(:"ip_allowlist.updated") => %{
                optional(:allowed_ips) => list(String.t()),
                optional(:id) => String.t()
              },
              optional(:"login.failed") => %{
                optional(:error_code) => String.t(),
                optional(:error_message) => String.t()
              },
              optional(:"login.succeeded") => map(),
              optional(:"logout.failed") => %{
                optional(:error_code) => String.t(),
                optional(:error_message) => String.t()
              },
              optional(:"logout.succeeded") => map(),
              optional(:"organization.updated") => %{
                optional(:changes_requested) => %{
                  optional(:api_call_logging) => String.t(),
                  optional(:api_call_logging_project_ids) => String.t(),
                  optional(:description) => String.t(),
                  optional(:name) => String.t(),
                  optional(:threads_ui_visibility) => String.t(),
                  optional(:title) => String.t(),
                  optional(:usage_dashboard_visibility) => String.t()
                },
                optional(:id) => String.t()
              },
              optional(:project) => %{optional(:id) => String.t(), optional(:name) => String.t()},
              optional(:"project.archived") => %{optional(:id) => String.t()},
              optional(:"project.created") => %{
                optional(:data) => %{
                  optional(:name) => String.t(),
                  optional(:title) => String.t()
                },
                optional(:id) => String.t()
              },
              optional(:"project.deleted") => %{optional(:id) => String.t()},
              optional(:"project.updated") => %{
                optional(:changes_requested) => %{optional(:title) => String.t()},
                optional(:id) => String.t()
              },
              optional(:"rate_limit.deleted") => %{optional(:id) => String.t()},
              optional(:"rate_limit.updated") => %{
                optional(:changes_requested) => %{
                  optional(:batch_1_day_max_input_tokens) => integer(),
                  optional(:max_audio_megabytes_per_1_minute) => integer(),
                  optional(:max_images_per_1_minute) => integer(),
                  optional(:max_requests_per_1_day) => integer(),
                  optional(:max_requests_per_1_minute) => integer(),
                  optional(:max_tokens_per_1_minute) => integer()
                },
                optional(:id) => String.t()
              },
              optional(:"role.assignment.created") => %{
                optional(:id) => String.t(),
                optional(:principal_id) => String.t(),
                optional(:principal_type) => String.t(),
                optional(:resource_id) => String.t(),
                optional(:resource_type) => String.t()
              },
              optional(:"role.assignment.deleted") => %{
                optional(:id) => String.t(),
                optional(:principal_id) => String.t(),
                optional(:principal_type) => String.t(),
                optional(:resource_id) => String.t(),
                optional(:resource_type) => String.t()
              },
              optional(:"role.bound_to_resource") => %{
                optional(:connector_id) => String.t(),
                optional(:connector_name) => String.t(),
                optional(:enabled) => boolean(),
                optional(:id) => String.t(),
                optional(:permissions) => list(String.t()),
                optional(:resource_id) => String.t(),
                optional(:resource_type) => String.t(),
                optional(:role_id) => String.t(),
                optional(:source) =>
                  ((((:role_toggle | :role_connector_update) | :role_delete)
                    | :workspace_permissions)
                   | :connector_publish)
                  | String.t(),
                optional(:workspace_id) => String.t()
              },
              optional(:"role.created") => %{
                optional(:id) => String.t(),
                optional(:permissions) => list(String.t()),
                optional(:resource_id) => String.t(),
                optional(:resource_type) => String.t(),
                optional(:role_name) => String.t()
              },
              optional(:"role.deleted") => %{optional(:id) => String.t()},
              optional(:"role.unbound_from_resource") => %{
                optional(:connector_id) => String.t(),
                optional(:connector_name) => String.t(),
                optional(:enabled) => boolean(),
                optional(:id) => String.t(),
                optional(:permissions) => list(String.t()),
                optional(:resource_id) => String.t(),
                optional(:resource_type) => String.t(),
                optional(:role_id) => String.t(),
                optional(:source) =>
                  ((((:role_toggle | :role_connector_update) | :role_delete)
                    | :workspace_permissions)
                   | :connector_publish)
                  | String.t(),
                optional(:workspace_id) => String.t()
              },
              optional(:"role.updated") => %{
                optional(:changes_requested) => %{
                  optional(:description) => String.t(),
                  optional(:metadata) => map(),
                  optional(:permissions_added) => list(String.t()),
                  optional(:permissions_removed) => list(String.t()),
                  optional(:resource_id) => String.t(),
                  optional(:resource_type) => String.t(),
                  optional(:role_name) => String.t()
                },
                optional(:id) => String.t()
              },
              optional(:"scim.disabled") => %{optional(:id) => String.t()},
              optional(:"scim.enabled") => %{optional(:id) => String.t()},
              optional(:"service_account.created") => %{
                optional(:data) => %{optional(:role) => String.t()},
                optional(:id) => String.t()
              },
              optional(:"service_account.deleted") => %{optional(:id) => String.t()},
              optional(:"service_account.updated") => %{
                optional(:changes_requested) => %{optional(:role) => String.t()},
                optional(:id) => String.t()
              },
              required(:type) => ExOpenAI.Components.AuditLogEventType.input(),
              optional(:"user.added") => %{
                optional(:data) => %{optional(:role) => String.t()},
                optional(:id) => String.t()
              },
              optional(:"user.deleted") => %{optional(:id) => String.t()},
              optional(:"user.updated") => %{
                optional(:changes_requested) => %{optional(:role) => String.t()},
                optional(:id) => String.t()
              },
              optional(:"workload_identity_provider.created") => %{
                optional(:data) => map(),
                optional(:id) => String.t()
              },
              optional(:"workload_identity_provider.deleted") => %{
                optional(:id) => String.t(),
                optional(:name) => String.t()
              },
              optional(:"workload_identity_provider.updated") => %{
                optional(:changes_requested) => map(),
                optional(:id) => String.t()
              },
              optional(:"workload_identity_provider_mapping.created") => %{
                optional(:data) => map(),
                optional(:id) => String.t(),
                optional(:identity_provider_id) => String.t()
              },
              optional(:"workload_identity_provider_mapping.deleted") => %{
                optional(:id) => String.t(),
                optional(:identity_provider_id) => String.t(),
                optional(:project_id) => String.t(),
                optional(:service_account_id) => String.t()
              },
              optional(:"workload_identity_provider_mapping.updated") => %{
                optional(:changes_requested) => map(),
                optional(:id) => String.t(),
                optional(:identity_provider_id) => String.t()
              }
            }
  defstruct [
    :actor,
    :"api_key.created",
    :"api_key.deleted",
    :"api_key.updated",
    :"certificate.created",
    :"certificate.deleted",
    :"certificate.updated",
    :"certificates.activated",
    :"certificates.deactivated",
    :"checkpoint.permission.created",
    :"checkpoint.permission.deleted",
    :effective_at,
    :"external_key.registered",
    :"external_key.removed",
    :"group.created",
    :"group.deleted",
    :"group.updated",
    :id,
    :"invite.accepted",
    :"invite.deleted",
    :"invite.sent",
    :"ip_allowlist.config.activated",
    :"ip_allowlist.config.deactivated",
    :"ip_allowlist.created",
    :"ip_allowlist.deleted",
    :"ip_allowlist.updated",
    :"login.failed",
    :"login.succeeded",
    :"logout.failed",
    :"logout.succeeded",
    :"organization.updated",
    :project,
    :"project.archived",
    :"project.created",
    :"project.deleted",
    :"project.updated",
    :"rate_limit.deleted",
    :"rate_limit.updated",
    :"role.assignment.created",
    :"role.assignment.deleted",
    :"role.bound_to_resource",
    :"role.created",
    :"role.deleted",
    :"role.unbound_from_resource",
    :"role.updated",
    :"scim.disabled",
    :"scim.enabled",
    :"service_account.created",
    :"service_account.deleted",
    :"service_account.updated",
    :type,
    :"user.added",
    :"user.deleted",
    :"user.updated",
    :"workload_identity_provider.created",
    :"workload_identity_provider.deleted",
    :"workload_identity_provider.updated",
    :"workload_identity_provider_mapping.created",
    :"workload_identity_provider_mapping.deleted",
    :"workload_identity_provider_mapping.updated"
  ]
end
