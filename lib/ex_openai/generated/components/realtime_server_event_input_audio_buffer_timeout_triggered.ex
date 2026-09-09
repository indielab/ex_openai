defmodule ExOpenAI.Components.RealtimeServerEventInputAudioBufferTimeoutTriggered do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the Server VAD timeout is triggered for the input audio buffer. This is configured
  with `idle_timeout_ms` in the `turn_detection` settings of the session, and it indicates that
  there hasn't been any speech detected for the configured duration.

  The `audio_start_ms` and `audio_end_ms` fields indicate the segment of audio after the last
  model response up to the triggering time, as an offset from the beginning of audio written
  to the input audio buffer. This means it demarcates the segment of audio that was silent and
  the difference between the start and end values will roughly match the configured timeout.

  The empty audio will be committed to the conversation as an `input_audio` item (there will be a
  `input_audio_buffer.committed` event) and a model response will be generated. There may be speech
  that didn't trigger VAD but is still detected by the model, so the model may respond with
  something relevant to the conversation or a prompt to continue speaking.


  ## Fields

  * `:audio_end_ms` - **required** - `integer()`
    Millisecond offset of audio written to the input audio buffer at the time the timeout was triggered.

  * `:audio_start_ms` - **required** - `integer()`
    Millisecond offset of audio written to the input audio buffer that was after the playback time of the last model response.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item associated with this segment.

  * `:type` - **required** - `:"input_audio_buffer.timeout_triggered"`
    The event type, must be `input_audio_buffer.timeout_triggered`.
    Allowed values: `"input_audio_buffer.timeout_triggered"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio_end_ms: integer(),
          audio_start_ms: integer(),
          event_id: String.t(),
          item_id: String.t(),
          type: :"input_audio_buffer.timeout_triggered"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:audio_end_ms) => integer(),
              required(:audio_start_ms) => integer(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:type) => :"input_audio_buffer.timeout_triggered" | String.t()
            }
  defstruct [:audio_end_ms, :audio_start_ms, :event_id, :item_id, :type]
end
