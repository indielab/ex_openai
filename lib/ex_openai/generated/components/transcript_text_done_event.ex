defmodule ExOpenAI.Components.TranscriptTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

  ## Fields

  * `:languages` - **optional** - `list(ExOpenAI.Components.TranscriptionLanguage.t())`
    The languages detected in the audio. Returned by `gpt-transcribe`. An empty array indicates that no language could be reliably detected.

  * `:logprobs` - **optional** - `list(%{ optional(:bytes) => list(integer()), optional(:logprob) => number(), optional(:token) => String.t() })`
    The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.

  * `:text` - **required** - `String.t()`
    The text that was transcribed.

  * `:type` - **required** - `:"transcript.text.done"`
    The type of the event. Always `transcript.text.done`.
    Allowed values: `"transcript.text.done"`

  * `:usage` - **optional** - `ExOpenAI.Components.TranscriptTextUsageTokens.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          languages: list(ExOpenAI.Components.TranscriptionLanguage.t()) | nil,
          logprobs:
            list(%{
              optional(:bytes) => list(integer()),
              optional(:logprob) => number(),
              optional(:token) => String.t()
            })
            | nil,
          text: String.t(),
          type: :"transcript.text.done",
          usage: ExOpenAI.Components.TranscriptTextUsageTokens.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:languages) => list(ExOpenAI.Components.TranscriptionLanguage.input()),
              optional(:logprobs) =>
                list(%{
                  optional(:bytes) => list(integer()),
                  optional(:logprob) => number(),
                  optional(:token) => String.t()
                }),
              required(:text) => String.t(),
              required(:type) => :"transcript.text.done" | String.t(),
              optional(:usage) => ExOpenAI.Components.TranscriptTextUsageTokens.input()
            }
  defstruct [:languages, :logprobs, :text, :type, :usage]
end
