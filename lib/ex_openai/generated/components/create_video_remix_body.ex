defmodule ExOpenAI.Components.CreateVideoRemixBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for remixing an existing generated video.

  ## Fields

  * `:prompt` - **required** - `String.t()`  
    Updated text prompt that directs the remix generation.  
    Constraints: minLength: 1, maxLength: 32000
  """
  @type t() :: %{__struct__: __MODULE__, prompt: String.t()}
  defstruct [:prompt]
end
