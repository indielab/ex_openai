defmodule ExOpenAI.Components.RealtimeClientEventOutputAudioBufferClear do
  use ExOpenAI.Jason

  @moduledoc """
  **WebRTC/SIP Only:** Emit to cut off the current audio response. This will trigger the server to
  stop generating audio and emit a `output_audio_buffer.cleared` event. This
  event should be preceded by a `response.cancel` client event to stop the
  generation of the current response.
  [Learn more](https://platform.openai.com/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    The unique ID of the client event used for error handling.

  * `:type` - **required** - `:"output_audio_buffer.clear"`
    The event type, must be `output_audio_buffer.clear`.
    Allowed values: `"output_audio_buffer.clear"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          type: :"output_audio_buffer.clear"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:event_id) => String.t(),
              required(:type) => :"output_audio_buffer.clear" | String.t()
            }
  defstruct [:event_id, :type]
end
