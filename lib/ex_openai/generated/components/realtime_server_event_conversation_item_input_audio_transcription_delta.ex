defmodule ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the text value of an input audio transcription content part is updated with incremental transcription results.


  ## Fields

  * `:content_index` - **optional** - `integer()`  
    The index of the content part in the item's content array.

  * `:delta` - **optional** - `String.t()`  
    The text delta.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the item containing the audio that is being transcribed.

  * `:logprobs` - **optional** - `[ExOpenAI.Components.LogProbProperties.t()] | any()`

  * `:type` - **required** - `:"conversation.item.input_audio_transcription.delta"`  
    The event type, must be `conversation.item.input_audio_transcription.delta`.  
    Allowed values: `"conversation.item.input_audio_transcription.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer() | nil,
          delta: String.t() | nil,
          event_id: String.t(),
          item_id: String.t(),
          logprobs: (list(ExOpenAI.Components.LogProbProperties.t()) | any()) | nil,
          type: :"conversation.item.input_audio_transcription.delta"
        }
  defstruct [:content_index, :delta, :event_id, :item_id, :logprobs, :type]
end
