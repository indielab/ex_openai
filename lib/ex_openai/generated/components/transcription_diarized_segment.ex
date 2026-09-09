defmodule ExOpenAI.Components.TranscriptionDiarizedSegment do
  use ExOpenAI.Jason

  @moduledoc """
  A segment of diarized transcript text with speaker metadata.

  ## Fields

  * `:end` - **required** - `number()`
    End timestamp of the segment in seconds.
    Format: `double`

  * `:id` - **required** - `String.t()`
    Unique identifier for the segment.

  * `:speaker` - **required** - `String.t()`
    Speaker label for this segment. When known speakers are provided, the label matches `known_speaker_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, ...).

  * `:start` - **required** - `number()`
    Start timestamp of the segment in seconds.
    Format: `double`

  * `:text` - **required** - `String.t()`
    Transcript text for this segment.

  * `:type` - **required** - `:"transcript.text.segment"`
    The type of the segment. Always `transcript.text.segment`.
    Allowed values: `"transcript.text.segment"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end: number(),
          id: String.t(),
          speaker: String.t(),
          start: number(),
          text: String.t(),
          type: :"transcript.text.segment"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:end) => number(),
              required(:id) => String.t(),
              required(:speaker) => String.t(),
              required(:start) => number(),
              required(:text) => String.t(),
              required(:type) => :"transcript.text.segment" | String.t()
            }
  defstruct [:end, :id, :speaker, :start, :text, :type]
end
