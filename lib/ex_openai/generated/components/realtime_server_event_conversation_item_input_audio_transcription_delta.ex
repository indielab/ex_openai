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

  * `:logprobs` - **optional** - `list(ExOpenAI.Components.LogProbProperties.t()) | nil`

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
          logprobs: (list(ExOpenAI.Components.LogProbProperties.t()) | nil) | nil,
          type: :"conversation.item.input_audio_transcription.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:content_index) => integer(),
              optional(:delta) => String.t(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              optional(:logprobs) => list(ExOpenAI.Components.LogProbProperties.input()) | nil,
              required(:type) => :"conversation.item.input_audio_transcription.delta" | String.t()
            }
  defstruct [:content_index, :delta, :event_id, :item_id, :logprobs, :type]
end
