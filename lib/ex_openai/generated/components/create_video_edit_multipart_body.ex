defmodule ExOpenAI.Components.CreateVideoEditMultipartBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for editing an existing generated video.

  ## Fields

  * `:prompt` - **required** - `String.t()`  
    Text prompt that describes how to edit the source video.  
    Constraints: minLength: 1, maxLength: 32000

  * `:video` - **required** - `binary() | ExOpenAI.Components.VideoReferenceInputParam.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          prompt: String.t(),
          video: binary() | ExOpenAI.Components.VideoReferenceInputParam.t()
        }
  defstruct [:prompt, :video]
end
