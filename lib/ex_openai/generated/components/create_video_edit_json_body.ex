defmodule ExOpenAI.Components.CreateVideoEditJsonBody do
  use ExOpenAI.Jason

  @moduledoc """
  JSON parameters for editing an existing generated video.

  ## Fields

  * `:prompt` - **required** - `String.t()`  
    Text prompt that describes how to edit the source video.  
    Constraints: minLength: 1, maxLength: 32000

  * `:video` - **required** - `ExOpenAI.Components.VideoReferenceInputParam.t()`  
    Reference to the completed video to edit.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          prompt: String.t(),
          video: ExOpenAI.Components.VideoReferenceInputParam.t()
        }
  defstruct [:prompt, :video]
end
