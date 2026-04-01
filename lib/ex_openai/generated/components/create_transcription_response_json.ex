defmodule ExOpenAI.Components.CreateTranscriptionResponseJson do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a transcription response returned by model, based on the provided input.

  ## Fields

  * `:logprobs` - **optional** - `[{:%{}, [], [{{:optional, [], [:bytes]}, {:list, [], [{:number, [], []}]}}, {{:optional, [], [:logprob]}, {:number, [], []}}, {{:optional, [], [:token]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.

  * `:text` - **required** - `String.t()`  
    The transcribed text.

  * `:usage` - **optional** - `map()`  
    Token usage statistics for the request.
  """
  @type t() :: %{
          __struct__: __MODULE__,
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
  defstruct [:logprobs, :text, :usage]
end
