defmodule ExOpenAI.Components.AudioTranscription do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AudioTranscription.

  ## Fields

  * `:language` - **optional** - `String.t()`  
    The language of the input audio. Supplying the input language in
  [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
  will improve accuracy and latency.

  * `:model` - **optional** - `String.t() | :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | :"gpt-4o-transcribe" | :"gpt-4o-transcribe-diarize"`  
    The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.

  * `:prompt` - **optional** - `String.t()`  
    An optional text to guide the model's style or continue a previous audio
  segment.
  For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
  For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example "expect words related to technology".
  """
  @type t() :: %{
          __struct__: __MODULE__,
          language: String.t() | nil,
          model:
            (String.t()
             | (((:"whisper-1" | :"gpt-4o-mini-transcribe")
                 | :"gpt-4o-mini-transcribe-2025-12-15")
                | :"gpt-4o-transcribe")
             | :"gpt-4o-transcribe-diarize")
            | nil,
          prompt: String.t() | nil
        }
  defstruct [:language, :model, :prompt]
end
