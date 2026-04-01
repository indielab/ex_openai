defmodule ExOpenAI.Components.CreateVoiceRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateVoiceRequest.

  ## Fields

  * `:audio_sample` - **required** - `binary()`  
    The sample audio recording file. Maximum size is 10 MiB.

  Supported MIME types:
  `audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.  
    Format: `binary`

  * `:consent` - **required** - `String.t()`  
    The consent recording ID (for example, `cons_1234`).

  * `:name` - **required** - `String.t()`  
    The name of the new voice.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio_sample: binary(),
          consent: String.t(),
          name: String.t()
        }
  defstruct [:audio_sample, :consent, :name]
end
