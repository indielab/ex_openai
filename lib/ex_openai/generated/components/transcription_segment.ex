defmodule ExOpenAI.Components.TranscriptionSegment do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TranscriptionSegment.

  ## Fields

  * `:avg_logprob` - **required** - `number()`
    Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
    Format: `float`

  * `:compression_ratio` - **required** - `number()`
    Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
    Format: `float`

  * `:end` - **required** - `number()`
    End time of the segment in seconds.
    Format: `double`

  * `:id` - **required** - `integer()`
    Unique identifier of the segment.

  * `:no_speech_prob` - **required** - `number()`
    Probability of no speech in the segment. If the value is higher than 1.0 and the `avg_logprob` is below -1, consider this segment silent.
    Format: `float`

  * `:seek` - **required** - `integer()`
    Seek offset of the segment.

  * `:start` - **required** - `number()`
    Start time of the segment in seconds.
    Format: `double`

  * `:temperature` - **required** - `number()`
    Temperature parameter used for generating the segment.
    Format: `float`

  * `:text` - **required** - `String.t()`
    Text content of the segment.

  * `:tokens` - **required** - `list(integer())`
    Array of token IDs for the text content.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          avg_logprob: number(),
          compression_ratio: number(),
          end: number(),
          id: integer(),
          no_speech_prob: number(),
          seek: integer(),
          start: number(),
          temperature: number(),
          text: String.t(),
          tokens: list(integer())
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:avg_logprob) => number(),
              required(:compression_ratio) => number(),
              required(:end) => number(),
              required(:id) => integer(),
              required(:no_speech_prob) => number(),
              required(:seek) => integer(),
              required(:start) => number(),
              required(:temperature) => number(),
              required(:text) => String.t(),
              required(:tokens) => list(integer())
            }
  defstruct [
    :avg_logprob,
    :compression_ratio,
    :end,
    :id,
    :no_speech_prob,
    :seek,
    :start,
    :temperature,
    :text,
    :tokens
  ]
end
