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

  * `:languages` - **optional** - `list(ExOpenAI.Components.TranscriptionLanguage.t())`
    The languages detected in the audio. Returned by `gpt-transcribe`. An empty array indicates that no language could be reliably detected.

  * `:logprobs` - **optional** - `list(ExOpenAI.Components.LogProbProperties.t()) | nil`

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
          languages: list(ExOpenAI.Components.TranscriptionLanguage.t()) | nil,
          logprobs: (list(ExOpenAI.Components.LogProbProperties.t()) | nil) | nil,
          transcript: String.t(),
          type: :"conversation.item.input_audio_transcription.completed",
          usage: map()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              optional(:languages) => list(ExOpenAI.Components.TranscriptionLanguage.input()),
              optional(:logprobs) => list(ExOpenAI.Components.LogProbProperties.input()) | nil,
              required(:transcript) => String.t(),
              required(:type) =>
                :"conversation.item.input_audio_transcription.completed" | String.t(),
              required(:usage) =>
                ExOpenAI.Components.TranscriptTextUsageTokens.input()
                | ExOpenAI.Components.TranscriptTextUsageDuration.input()
            }
  defstruct [
    :content_index,
    :event_id,
    :item_id,
    :languages,
    :logprobs,
    :transcript,
    :type,
    :usage
  ]
end
