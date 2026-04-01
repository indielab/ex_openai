defmodule ExOpenAI.Components.TranscriptionDiarizedSegment do
  use ExOpenAI.Jason

  @moduledoc """
  A segment of diarized transcript text with speaker metadata.

  ## Fields

  * `:end` - **required** - `number()`  
    End timestamp of the segment in seconds.  
    Format: `float`

  * `:id` - **required** - `String.t()`  
    Unique identifier for the segment.

  * `:speaker` - **required** - `String.t()`  
    Speaker label for this segment. When known speakers are provided, the label matches `known_speaker_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, ...).

  * `:start` - **required** - `number()`  
    Start timestamp of the segment in seconds.  
    Format: `float`

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
  defstruct [:end, :id, :speaker, :start, :text, :type]
end
