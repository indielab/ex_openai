defmodule ExOpenAI.Components.ResponseAudioDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial audio response.

  ## Fields

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
          delta: String.t(),
          sequence_number: integer(),
          type: :"response.audio.delta"
        }
  defstruct [:delta, :sequence_number, :type]
end
