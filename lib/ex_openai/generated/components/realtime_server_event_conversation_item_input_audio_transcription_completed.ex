defmodule ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionCompleted do
  use ExOpenAI.Jason

  @moduledoc """
  This event is the output of audio transcription for user audio written to the
  user audio buffer. Transcription begins when the input audio buffer is
  committed by the client or server (when VAD is enabled). Transcription runs
  asynchronously with Response creation, so this event may come before or after
  the Response events.

  Realtime API models accept audio natively, and thus input transcription is a
  separate process run on a separate ASR (Automatic Speech Recognition) model.
  The transcript may diverge somewhat from the model's interpretation, and
  should be treated as a rough guide.


  ## Fields

  * `:content_index` - **required** - `integer()`  
    The index of the content part containing the audio.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the item containing the audio that is being transcribed.

  * `:logprobs` - **optional** - `[ExOpenAI.Components.LogProbProperties.t()] | any()`

  * `:transcript` - **required** - `String.t()`  
    The transcribed text.

  * `:type` - **required** - `:"conversation.item.input_audio_transcription.completed"`  
    The event type, must be
  `conversation.item.input_audio_transcription.completed`.  
    Allowed values: `"conversation.item.input_audio_transcription.completed"`

  * `:usage` - **required** - `map()`  
    Usage statistics for the transcription, this is billed according to the ASR model's pricing rather than the realtime model's pricing.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          event_id: String.t(),
          item_id: String.t(),
          logprobs: (list(ExOpenAI.Components.LogProbProperties.t()) | any()) | nil,
          transcript: String.t(),
          type: :"conversation.item.input_audio_transcription.completed",
          usage: map()
        }
  defstruct [:content_index, :event_id, :item_id, :logprobs, :transcript, :type, :usage]
end
