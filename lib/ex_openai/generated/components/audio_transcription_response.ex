defmodule ExOpenAI.Components.AudioTranscriptionResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AudioTranscriptionResponse.

  ## Fields

  * `:language` - **optional** - `String.t()`
    The language of the input audio.

  * `:languages` - **optional** - `list(String.t())`
    The possible input audio languages configured for transcription, in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) format.
    Constraints: minItems: 1

  * `:model` - **optional** - `String.t() | :"whisper-1" | :"gpt-transcribe" | :"gpt-live-transcribe" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | :"gpt-4o-transcribe" | :"gpt-4o-transcribe-diarize" | :"gpt-realtime-whisper"`
    The model used for transcription. Current options are `whisper-1`, `gpt-transcribe`, `gpt-live-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, `gpt-4o-transcribe-diarize`, and `gpt-realtime-whisper`.

  * `:prompt` - **optional** - `String.t()`
    The prompt configured for input audio transcription, when present.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          language: String.t() | nil,
          languages: list(String.t()) | nil,
          model:
            (String.t()
             | ((((((:"whisper-1" | :"gpt-transcribe") | :"gpt-live-transcribe")
                   | :"gpt-4o-mini-transcribe")
                  | :"gpt-4o-mini-transcribe-2025-12-15")
                 | :"gpt-4o-transcribe")
                | :"gpt-4o-transcribe-diarize")
             | :"gpt-realtime-whisper")
            | nil,
          prompt: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:language) => String.t(),
              optional(:languages) => list(String.t()),
              optional(:model) =>
                String.t()
                | (((((((:"whisper-1" | :"gpt-transcribe") | :"gpt-live-transcribe")
                       | :"gpt-4o-mini-transcribe")
                      | :"gpt-4o-mini-transcribe-2025-12-15")
                     | :"gpt-4o-transcribe")
                    | :"gpt-4o-transcribe-diarize")
                   | :"gpt-realtime-whisper")
                | String.t(),
              optional(:prompt) => String.t()
            }
  defstruct [:language, :languages, :model, :prompt]
end
