defmodule ExOpenAI.Components.BetaResponseAudioDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial audio response.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:delta` - **required** - `String.t()`
    A chunk of Base64 encoded response audio bytes.

  * `:sequence_number` - **required** - `integer()`
    A sequence number for this chunk of the stream response.

  * `:type` - **required** - `:"response.audio.delta"`
    The type of the event. Always `response.audio.delta`.
    Allowed values: `"response.audio.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          delta: String.t(),
          sequence_number: integer(),
          type: :"response.audio.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:delta) => String.t(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.audio.delta" | String.t()
            }
  defstruct [:agent, :delta, :sequence_number, :type]
end
