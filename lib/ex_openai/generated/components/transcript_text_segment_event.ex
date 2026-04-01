defmodule ExOpenAI.Components.TranscriptTextSegmentEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response_format` set to `diarized_json`.


  ## Fields

  * `:end` - **required** - `number()`  
    End timestamp of the segment in seconds.  
    Format: `float`

  * `:id` - **required** - `String.t()`  
    Unique identifier for the segment.

  * `:speaker` - **required** - `String.t()`  
    Speaker label for this segment.

  * `:start` - **required** - `number()`  
    Start timestamp of the segment in seconds.  
    Format: `float`

  * `:text` - **required** - `String.t()`  
    Transcript text for this segment.

  * `:type` - **required** - `:"transcript.text.segment"`  
    The type of the event. Always `transcript.text.segment`.  
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
