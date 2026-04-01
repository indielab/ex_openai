defmodule ExOpenAI.Components.TranscriptionWord do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TranscriptionWord.

  ## Fields

  * `:end` - **required** - `number()`  
    End time of the word in seconds.  
    Format: `float`

  * `:start` - **required** - `number()`  
    Start time of the word in seconds.  
    Format: `float`

  * `:word` - **required** - `String.t()`  
    The text content of the word.
  """
  @type t() :: %{__struct__: __MODULE__, end: number(), start: number(), word: String.t()}
  defstruct [:end, :start, :word]
end
