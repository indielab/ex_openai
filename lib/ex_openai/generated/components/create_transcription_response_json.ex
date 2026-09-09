defmodule ExOpenAI.Components.CreateTranscriptionResponseJson do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a transcription response returned by model, based on the provided input.

  ## Fields

  * `:languages` - **optional** - `list(ExOpenAI.Components.TranscriptionLanguage.t())`
    The languages detected in the audio. Returned by `gpt-transcribe`. An empty array indicates that no language could be reliably detected.

  * `:logprobs` - **optional** - `list(%{ optional(:bytes) => list(number()), optional(:logprob) => number(), optional(:token) => String.t() })`
    The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.

  * `:text` - **required** - `String.t()`
    The transcribed text.

  * `:usage` - **optional** - `map()`
    Token usage statistics for the request.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          languages: list(ExOpenAI.Components.TranscriptionLanguage.t()) | nil,
          logprobs:
            list(%{
              optional(:bytes) => list(number()),
              optional(:logprob) => number(),
              optional(:token) => String.t()
            })
            | nil,
          text: String.t(),
          usage: map() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:languages) => list(ExOpenAI.Components.TranscriptionLanguage.input()),
              optional(:logprobs) =>
                list(%{
                  optional(:bytes) => list(number()),
                  optional(:logprob) => number(),
                  optional(:token) => String.t()
                }),
              required(:text) => String.t(),
              optional(:usage) =>
                ExOpenAI.Components.TranscriptTextUsageTokens.input()
                | ExOpenAI.Components.TranscriptTextUsageDuration.input()
            }
  defstruct [:languages, :logprobs, :text, :usage]
end
