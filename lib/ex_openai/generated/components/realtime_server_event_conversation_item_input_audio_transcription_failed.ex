defmodule ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionFailed do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when input audio transcription is configured, and a transcription
  request for a user message failed. These events are separate from other
  `error` events so that the client can identify the related Item.


  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the content part containing the audio.

  * `:error` - **required** - `%{ optional(:code) => String.t(), optional(:message) => String.t(), optional(:param) => String.t(), optional(:type) => String.t() }`
    Details of the transcription error.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the user message item.

  * `:type` - **required** - `:"conversation.item.input_audio_transcription.failed"`
    The event type, must be
  `conversation.item.input_audio_transcription.failed`.
    Allowed values: `"conversation.item.input_audio_transcription.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          error: %{
            optional(:code) => String.t(),
            optional(:message) => String.t(),
            optional(:param) => String.t(),
            optional(:type) => String.t()
          },
          event_id: String.t(),
          item_id: String.t(),
          type: :"conversation.item.input_audio_transcription.failed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:error) => %{
                optional(:code) => String.t(),
                optional(:message) => String.t(),
                optional(:param) => String.t(),
                optional(:type) => String.t()
              },
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:type) =>
                :"conversation.item.input_audio_transcription.failed" | String.t()
            }
  defstruct [:content_index, :error, :event_id, :item_id, :type]
end
