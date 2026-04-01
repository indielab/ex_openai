defmodule ExOpenAI.Components.CreateTranslationResponseVerboseJson do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateTranslationResponseVerboseJson.

  ## Fields

  * `:duration` - **required** - `number()`  
    The duration of the input audio.

  * `:language` - **required** - `String.t()`  
    The language of the output translation (always `english`).

  * `:segments` - **optional** - `[ExOpenAI.Components.TranscriptionSegment.t()]`  
    Segments of the translated text and their corresponding details.

  * `:text` - **required** - `String.t()`  
    The translated text.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          duration: number(),
          language: String.t(),
          segments: list(ExOpenAI.Components.TranscriptionSegment.t()) | nil,
          text: String.t()
        }
  defstruct [:duration, :language, :segments, :text]
end
