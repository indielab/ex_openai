defmodule ExOpenAI.Components.AudioTranscription do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AudioTranscription.

  ## Fields

  * `:delay` - **optional** - `:minimal | :low | :medium | :high | :xhigh`
    Controls how long the model waits before emitting transcription text.
  Higher values can improve transcription accuracy at the cost of latency.
  Only supported with `gpt-realtime-whisper` in GA Realtime sessions.
    Allowed values: `"minimal"`, `"low"`, `"medium"`, `"high"`, `"xhigh"`

  * `:keywords` - **optional** - `list(String.t())`
    Words or phrases to guide transcription of the input audio. Supported by `gpt-transcribe` and `gpt-live-transcribe`.

  * `:language` - **optional** - `String.t()`
    The language of the input audio. Supplying the input language in
  [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
  will improve accuracy and latency.

  * `:languages` - **optional** - `list(String.t())`
    Possible languages of the input audio, in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) format. Supported by `gpt-transcribe` and `gpt-live-transcribe`.
    Constraints: minItems: 1

  * `:model` - **optional** - `String.t() | :"whisper-1" | :"gpt-transcribe" | :"gpt-live-transcribe" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | :"gpt-4o-transcribe" | :"gpt-4o-transcribe-diarize" | :"gpt-realtime-whisper"`
    The model to use for transcription. Current options are `whisper-1`, `gpt-transcribe`, `gpt-live-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, `gpt-4o-transcribe-diarize`, and `gpt-realtime-whisper`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.

  * `:prompt` - **optional** - `String.t()`
    An optional text to guide the model's style or continue a previous audio
  segment.
  For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
  For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example "expect words related to technology".
  Prompt is not supported with `gpt-realtime-whisper` in GA Realtime sessions.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delay: ((((:minimal | :low) | :medium) | :high) | :xhigh) | nil,
          keywords: list(String.t()) | nil,
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
              optional(:delay) => ((((:minimal | :low) | :medium) | :high) | :xhigh) | String.t(),
              optional(:keywords) => list(String.t()),
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
  defstruct [:delay, :keywords, :language, :languages, :model, :prompt]
end
