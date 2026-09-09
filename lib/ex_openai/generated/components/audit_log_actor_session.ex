defmodule ExOpenAI.Components.AuditLogActorSession do
  use ExOpenAI.Jason

  @moduledoc """
  The session in which the audit logged action was performed.

  ## Fields

  * `:ip_address` - **optional** - `String.t()`
    The IP address from which the action was performed.

  * `:user` - **optional** - `ExOpenAI.Components.AuditLogActorUser.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          ip_address: String.t() | nil,
          user: ExOpenAI.Components.AuditLogActorUser.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:ip_address) => String.t(),
              optional(:user) => ExOpenAI.Components.AuditLogActorUser.input()
            }
  defstruct [:ip_address, :user]
end
