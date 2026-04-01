defmodule ExOpenAI.Components.CreateTranscriptionResponseDiarizedJson do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.


  ## Fields

  * `:duration` - **required** - `number()`  
    Duration of the input audio in seconds.

  * `:segments` - **required** - `[ExOpenAI.Components.TranscriptionDiarizedSegment.t()]`  
    Segments of the transcript annotated with timestamps and speaker labels.

  * `:task` - **required** - `:transcribe`  
    The type of task that was run. Always `transcribe`.  
    Allowed values: `"transcribe"`

  * `:text` - **required** - `String.t()`  
    The concatenated transcript text for the entire audio input.

  * `:usage` - **optional** - `map()`  
    Token or duration usage statistics for the request.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          duration: number(),
          segments: list(ExOpenAI.Components.TranscriptionDiarizedSegment.t()),
          task: :transcribe,
          text: String.t(),
          usage: map() | nil
        }
  defstruct [:duration, :segments, :task, :text, :usage]
end
