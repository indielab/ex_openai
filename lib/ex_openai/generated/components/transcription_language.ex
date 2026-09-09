defmodule ExOpenAI.Components.TranscriptionLanguage do
  use ExOpenAI.Jason

  @moduledoc """
  A language detected in transcribed audio.

  ## Fields

  * `:code` - **required** - `String.t()`
    The code of a language detected in the audio.
  """
  @type t() :: %{__struct__: __MODULE__, code: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:code) => String.t()}
  defstruct [:code]
end
