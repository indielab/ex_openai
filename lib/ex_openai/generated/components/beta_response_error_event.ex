defmodule ExOpenAI.Components.BetaResponseErrorEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an error occurs.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:code` - **required** - `String.t() | nil`

  * `:message` - **required** - `String.t()`
    The error message.

  * `:param` - **required** - `String.t() | nil`

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:error`
    The type of the event. Always `error`.
    Allowed values: `"error"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          code: String.t() | nil,
          message: String.t(),
          param: String.t() | nil,
          sequence_number: integer(),
          type: :error
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:code) => String.t() | nil,
              required(:message) => String.t(),
              required(:param) => String.t() | nil,
              required(:sequence_number) => integer(),
              required(:type) => :error | String.t()
            }
  defstruct [:agent, :code, :message, :param, :sequence_number, :type]
end
