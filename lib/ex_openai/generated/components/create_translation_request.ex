defmodule ExOpenAI.Components.CreateTranslationRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateTranslationRequest.

  ## Fields

  * `:file` - **required** - `binary()`  
    The audio file object (not file name) translate, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.  
    Format: `binary`

  * `:model` - **required** - `String.t() | :"whisper-1"`  
    ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available.

  * `:prompt` - **optional** - `String.t()`  
    An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text#prompting) should be in English.

  * `:response_format` - **optional** - `:json | :text | :srt | :verbose_json | :vtt`  
    The format of the output, in one of these options: `json`, `text`, `srt`, `verbose_json`, or `vtt`.  
    Allowed values: `"json"`, `"text"`, `"srt"`, `"verbose_json"`, `"vtt"`  
    Default: `"json"`

  * `:temperature` - **optional** - `number()`  
    The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.  
    Default: `0`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file: binary(),
          model: String.t() | :"whisper-1",
          prompt: String.t() | nil,
          response_format: ((((:json | :text) | :srt) | :verbose_json) | :vtt) | nil,
          temperature: number() | nil
        }
  defstruct [:file, :model, :prompt, :response_format, :temperature]
end
