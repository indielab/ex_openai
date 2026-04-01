defmodule ExOpenAI.Components.CreateTranscriptionResponseVerboseJson do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a verbose json transcription response returned by model, based on the provided input.

  ## Fields

  * `:duration` - **required** - `number()`  
    The duration of the input audio.

  * `:language` - **required** - `String.t()`  
    The language of the input audio.

  * `:segments` - **optional** - `[ExOpenAI.Components.TranscriptionSegment.t()]`  
    Segments of the transcribed text and their corresponding details.

  * `:text` - **required** - `String.t()`  
    The transcribed text.

  * `:usage` - **optional** - `ExOpenAI.Components.TranscriptTextUsageDuration.t()`

  * `:words` - **optional** - `[ExOpenAI.Components.TranscriptionWord.t()]`  
    Extracted words and their corresponding timestamps.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          duration: number(),
          language: String.t(),
          segments: list(ExOpenAI.Components.TranscriptionSegment.t()) | nil,
          text: String.t(),
          usage: ExOpenAI.Components.TranscriptTextUsageDuration.t() | nil,
          words: list(ExOpenAI.Components.TranscriptionWord.t()) | nil
        }
  defstruct [:duration, :language, :segments, :text, :usage, :words]
end
