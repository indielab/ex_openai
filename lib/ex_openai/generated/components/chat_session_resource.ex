defmodule ExOpenAI.Components.ChatSessionResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a ChatKit session and its resolved configuration.

  ## Fields

  * `:chatkit_configuration` - **required** - `ExOpenAI.Components.ChatSessionChatkitConfiguration.t()`
    Resolved ChatKit feature configuration for the session.

  * `:client_secret` - **required** - `String.t()`
    Ephemeral client secret that authenticates session requests.

  * `:expires_at` - **required** - `integer()`
    Unix timestamp (in seconds) for when the session expires.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier for the ChatKit session.

  * `:max_requests_per_1_minute` - **required** - `integer()`
    Convenience copy of the per-minute request limit.

  * `:object` - **required** - `:"chatkit.session"`
    Type discriminator that is always `chatkit.session`.
    Allowed values: `"chatkit.session"`
    Default: `"chatkit.session"`

  * `:rate_limits` - **required** - `ExOpenAI.Components.ChatSessionRateLimits.t()`
    Resolved rate limit values.

  * `:status` - **required** - `ExOpenAI.Components.ChatSessionStatus.t()`
    Current lifecycle state of the session.

  * `:user` - **required** - `String.t()`
    User identifier associated with the session.

  * `:workflow` - **required** - `ExOpenAI.Components.ChatkitWorkflow.t()`
    Workflow metadata for the session.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          chatkit_configuration: ExOpenAI.Components.ChatSessionChatkitConfiguration.t(),
          client_secret: String.t(),
          expires_at: integer(),
          id: String.t(),
          max_requests_per_1_minute: integer(),
          object: :"chatkit.session",
          rate_limits: ExOpenAI.Components.ChatSessionRateLimits.t(),
          status: ExOpenAI.Components.ChatSessionStatus.t(),
          user: String.t(),
          workflow: ExOpenAI.Components.ChatkitWorkflow.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:chatkit_configuration) =>
                ExOpenAI.Components.ChatSessionChatkitConfiguration.input(),
              required(:client_secret) => String.t(),
              required(:expires_at) => integer(),
              required(:id) => String.t(),
              required(:max_requests_per_1_minute) => integer(),
              required(:object) => :"chatkit.session" | String.t(),
              required(:rate_limits) => ExOpenAI.Components.ChatSessionRateLimits.input(),
              required(:status) => ExOpenAI.Components.ChatSessionStatus.input(),
              required(:user) => String.t(),
              required(:workflow) => ExOpenAI.Components.ChatkitWorkflow.input()
            }
  defstruct [
    :chatkit_configuration,
    :client_secret,
    :expires_at,
    :id,
    :max_requests_per_1_minute,
    :object,
    :rate_limits,
    :status,
    :user,
    :workflow
  ]
end
