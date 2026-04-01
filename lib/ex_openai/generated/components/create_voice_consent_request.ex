defmodule ExOpenAI.Components.CreateVoiceConsentRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateVoiceConsentRequest.

  ## Fields

  * `:language` - **required** - `String.t()`  
    The BCP 47 language tag for the consent phrase (for example, `en-US`).

  * `:name` - **required** - `String.t()`  
    The label to use for this consent recording.

  * `:recording` - **required** - `binary()`  
    The consent audio recording file. Maximum size is 10 MiB.

  Supported MIME types:
  `audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.  
    Format: `binary`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          language: String.t(),
          name: String.t(),
          recording: binary()
        }
  defstruct [:language, :name, :recording]
end
