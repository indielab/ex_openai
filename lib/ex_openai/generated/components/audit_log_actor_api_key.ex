defmodule ExOpenAI.Components.AuditLogActorApiKey do
  use ExOpenAI.Jason

  @moduledoc """
  The API Key used to perform the audit logged action.

  ## Fields

  * `:id` - **optional** - `String.t()`
    The tracking id of the API key.

  * `:service_account` - **optional** - `ExOpenAI.Components.AuditLogActorServiceAccount.t()`

  * `:type` - **optional** - `:user | :service_account`
    The type of API key. Can be either `user` or `service_account`.
    Allowed values: `"user"`, `"service_account"`

  * `:user` - **optional** - `ExOpenAI.Components.AuditLogActorUser.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t() | nil,
          service_account: ExOpenAI.Components.AuditLogActorServiceAccount.t() | nil,
          type: (:user | :service_account) | nil,
          user: ExOpenAI.Components.AuditLogActorUser.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:id) => String.t(),
              optional(:service_account) =>
                ExOpenAI.Components.AuditLogActorServiceAccount.input(),
              optional(:type) => (:user | :service_account) | String.t(),
              optional(:user) => ExOpenAI.Components.AuditLogActorUser.input()
            }
  defstruct [:id, :service_account, :type, :user]
end
