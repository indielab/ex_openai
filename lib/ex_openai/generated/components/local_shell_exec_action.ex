defmodule ExOpenAI.Components.LocalShellExecAction do
  use ExOpenAI.Jason

  @moduledoc """
  Execute a shell command on the server.

  ## Fields

  * `:command` - **required** - `[String.t()]`  
    The command to run.

  * `:env` - **required** - `map()`  
    Environment variables to set for the command.

  * `:timeout_ms` - **optional** - `integer() | any()`

  * `:type` - **required** - `:exec`  
    The type of the local shell action. Always `exec`.  
    Allowed values: `"exec"`  
    Default: `"exec"`

  * `:user` - **optional** - `String.t() | any()`

  * `:working_directory` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          command: list(String.t()),
          env: map(),
          timeout_ms: (integer() | any()) | nil,
          type: :exec,
          user: (String.t() | any()) | nil,
          working_directory: (String.t() | any()) | nil
        }
  defstruct [:command, :env, :timeout_ms, :type, :user, :working_directory]
end
