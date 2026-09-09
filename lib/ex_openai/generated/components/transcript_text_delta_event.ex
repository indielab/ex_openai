defmodule ExOpenAI.Components.TranscriptTextDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

  ## Fields

  * `:delta` - **required** - `String.t()`
    The text delta that was additionally transcribed.

  * `:logprobs` - **optional** - `list(%{ optional(:bytes) => list(integer()), optional(:logprob) => number(), optional(:token) => String.t() })`
    The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.

  * `:segment_id` - **optional** - `String.t()`
    Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.

  * `:type` - **required** - `:"transcript.text.delta"`
    The type of the event. Always `transcript.text.delta`.
    Allowed values: `"transcript.text.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          logprobs:
            list(%{
              optional(:bytes) => list(integer()),
              optional(:logprob) => number(),
              optional(:token) => String.t()
            })
            | nil,
          segment_id: String.t() | nil,
          type: :"transcript.text.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:delta) => String.t(),
              optional(:logprobs) =>
                list(%{
                  optional(:bytes) => list(integer()),
                  optional(:logprob) => number(),
                  optional(:token) => String.t()
                }),
              optional(:segment_id) => String.t(),
              required(:type) => :"transcript.text.delta" | String.t()
            }
  defstruct [:delta, :logprobs, :segment_id, :type]
end
