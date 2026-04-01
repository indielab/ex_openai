defmodule ExOpenAI.Components.CreateChatSessionBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for provisioning a new ChatKit session.

  ## Fields

  * `:chatkit_configuration` - **optional** - `ExOpenAI.Components.ChatkitConfigurationParam.t()`  
    Optional overrides for ChatKit runtime configuration features

  * `:expires_after` - **optional** - `ExOpenAI.Components.ExpiresAfterParam.t()`  
    Optional override for session expiration timing in seconds from creation. Defaults to 10 minutes.

  * `:rate_limits` - **optional** - `ExOpenAI.Components.RateLimitsParam.t()`  
    Optional override for per-minute request limits. When omitted, defaults to 10.

  * `:user` - **required** - `String.t()`  
    A free-form string that identifies your end user; ensures this Session can access other objects that have the same `user` scope.  
    Constraints: minLength: 1

  * `:workflow` - **required** - `ExOpenAI.Components.WorkflowParam.t()`  
    Workflow that powers the session.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          chatkit_configuration: ExOpenAI.Components.ChatkitConfigurationParam.t() | nil,
          expires_after: ExOpenAI.Components.ExpiresAfterParam.t() | nil,
          rate_limits: ExOpenAI.Components.RateLimitsParam.t() | nil,
          user: String.t(),
          workflow: ExOpenAI.Components.WorkflowParam.t()
        }
  defstruct [:chatkit_configuration, :expires_after, :rate_limits, :user, :workflow]
end
