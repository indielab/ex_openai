defmodule ExOpenAI.Components.BetaLocalShellExecAction do
  use ExOpenAI.Jason

  @moduledoc """
  Execute a shell command on the server.

  ## Fields

  * `:command` - **required** - `list(String.t())`
    The command to run.

  * `:env` - **required** - `map()`
    Environment variables to set for the command.

  * `:timeout_ms` - **optional** - `integer() | nil`

  * `:type` - **required** - `:exec`
    The type of the local shell action. Always `exec`.
    Allowed values: `"exec"`
    Default: `"exec"`

  * `:user` - **optional** - `String.t() | nil`

  * `:working_directory` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          command: list(String.t()),
          env: map(),
          timeout_ms: (integer() | nil) | nil,
          type: :exec,
          user: (String.t() | nil) | nil,
          working_directory: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:command) => list(String.t()),
              required(:env) => map(),
              optional(:timeout_ms) => integer() | nil,
              required(:type) => :exec | String.t(),
              optional(:user) => String.t() | nil,
              optional(:working_directory) => String.t() | nil
            }
  defstruct [:command, :env, :timeout_ms, :type, :user, :working_directory]
end
