defmodule ExOpenAI.Components.FunctionShellAction do
  use ExOpenAI.Jason

  @moduledoc """
  Execute a shell command.

  ## Fields

  * `:commands` - **required** - `list(String.t())`

  * `:max_output_length` - **required** - `integer() | nil`

  * `:timeout_ms` - **required** - `integer() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          commands: list(String.t()),
          max_output_length: integer() | nil,
          timeout_ms: integer() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:commands) => list(String.t()),
              required(:max_output_length) => integer() | nil,
              required(:timeout_ms) => integer() | nil
            }
  defstruct [:commands, :max_output_length, :timeout_ms]
end
