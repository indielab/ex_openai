defmodule ExOpenAI.Components.RealtimeBetaServerEventConversationItemInputAudioTranscriptionSegment do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an input audio transcription segment is identified for an item.

  ## Fields

  * `:content_index` - **required** - `integer()`  
    The index of the input audio content part within the item.

  * `:end` - **required** - `number()`  
    End time of the segment in seconds.  
    Format: `float`

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:id` - **required** - `String.t()`  
    The segment identifier.

  * `:item_id` - **required** - `String.t()`  
    The ID of the item containing the input audio content.

  * `:speaker` - **required** - `String.t()`  
    The detected speaker label for this segment.

  * `:start` - **required** - `number()`  
    Start time of the segment in seconds.  
    Format: `float`

  * `:text` - **required** - `String.t()`  
    The text for this segment.

  * `:type` - **required** - `:"conversation.item.input_audio_transcription.segment"`  
    The event type, must be `conversation.item.input_audio_transcription.segment`.  
    Allowed values: `"conversation.item.input_audio_transcription.segment"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          end: number(),
          event_id: String.t(),
          id: String.t(),
          item_id: String.t(),
          speaker: String.t(),
          start: number(),
          text: String.t(),
          type: :"conversation.item.input_audio_transcription.segment"
        }
  defstruct [:content_index, :end, :event_id, :id, :item_id, :speaker, :start, :text, :type]
end
