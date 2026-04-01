defmodule ExOpenAI.Components.RealtimeServerEventResponseAudioTranscriptDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the model-generated transcription of audio output is updated.


  ## Fields

  * `:content_index` - **required** - `integer()`  
    The index of the content part in the item's content array.

  * `:delta` - **required** - `String.t()`  
    The transcript delta.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the item.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`  
    The ID of the response.

  * `:type` - **required** - `:"response.output_audio_transcript.delta"`  
    The event type, must be `response.output_audio_transcript.delta`.  
    Allowed values: `"response.output_audio_transcript.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          delta: String.t(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.output_audio_transcript.delta"
        }
  defstruct [:content_index, :delta, :event_id, :item_id, :output_index, :response_id, :type]
end
