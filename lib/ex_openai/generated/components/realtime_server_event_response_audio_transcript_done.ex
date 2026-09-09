defmodule ExOpenAI.Components.RealtimeServerEventResponseAudioTranscriptDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the model-generated transcription of audio output is done
  streaming. Also emitted when a Response is interrupted, incomplete, or
  cancelled.


  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the content part in the item's content array.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`
    The ID of the response.

  * `:transcript` - **required** - `String.t()`
    The final transcript of the audio.

  * `:type` - **required** - `:"response.output_audio_transcript.done"`
    The event type, must be `response.output_audio_transcript.done`.
    Allowed values: `"response.output_audio_transcript.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          transcript: String.t(),
          type: :"response.output_audio_transcript.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:response_id) => String.t(),
              required(:transcript) => String.t(),
              required(:type) => :"response.output_audio_transcript.done" | String.t()
            }
  defstruct [:content_index, :event_id, :item_id, :output_index, :response_id, :transcript, :type]
end
