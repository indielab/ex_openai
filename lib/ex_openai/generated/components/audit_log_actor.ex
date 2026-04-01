defmodule ExOpenAI.Components.AuditLogActor do
  use ExOpenAI.Jason

  @moduledoc """
  The actor who performed the audit logged action.

  ## Fields

  * `:api_key` - **optional** - `ExOpenAI.Components.AuditLogActorApiKey.t()`

  * `:session` - **optional** - `ExOpenAI.Components.AuditLogActorSession.t()`

  * `:type` - **optional** - `:session | :api_key`  
    The type of actor. Is either `session` or `api_key`.  
    Allowed values: `"session"`, `"api_key"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key: ExOpenAI.Components.AuditLogActorApiKey.t() | nil,
          session: ExOpenAI.Components.AuditLogActorSession.t() | nil,
          type: (:session | :api_key) | nil
        }
  defstruct [:api_key, :session, :type]
end
