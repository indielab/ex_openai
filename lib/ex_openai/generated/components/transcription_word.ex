defmodule ExOpenAI.Components.TranscriptionWord do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TranscriptionWord.

  ## Fields

  * `:end` - **required** - `number()`
    End time of the word in seconds.
    Format: `double`

  * `:start` - **required** - `number()`
    Start time of the word in seconds.
    Format: `double`

  * `:word` - **required** - `String.t()`
    The text content of the word.
  """
  @type t() :: %{__struct__: __MODULE__, end: number(), start: number(), word: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:end) => number(),
              required(:start) => number(),
              required(:word) => String.t()
            }
  defstruct [:end, :start, :word]
end
