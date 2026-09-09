defmodule ExOpenAI.Components.RealtimeServerEventInputAudioBufferCleared do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the input audio buffer is cleared by the client with a
  `input_audio_buffer.clear` event.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:type` - **required** - `:"input_audio_buffer.cleared"`
    The event type, must be `input_audio_buffer.cleared`.
    Allowed values: `"input_audio_buffer.cleared"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          type: :"input_audio_buffer.cleared"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:type) => :"input_audio_buffer.cleared" | String.t()
            }
  defstruct [:event_id, :type]
end
