defmodule ExOpenAI.Components.TranscriptTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

  ## Fields

  * `:logprobs` - **optional** - `[{:%{}, [], [{{:optional, [], [:bytes]}, {:list, [], [{:integer, [], []}]}}, {{:optional, [], [:logprob]}, {:number, [], []}}, {{:optional, [], [:token]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.

  * `:text` - **required** - `String.t()`  
    The text that was transcribed.

  * `:type` - **required** - `:"transcript.text.done"`  
    The type of the event. Always `transcript.text.done`.  
    Allowed values: `"transcript.text.done"`

  * `:usage` - **optional** - `ExOpenAI.Components.TranscriptTextUsageTokens.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
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
  defstruct [:logprobs, :text, :type, :usage]
end
