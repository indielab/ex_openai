defmodule ExOpenAI.Components.CreateVideoExtendMultipartBody do
  use ExOpenAI.Jason

  @moduledoc """
  Multipart parameters for extending an existing generated video.

  ## Fields

  * `:prompt` - **required** - `String.t()`  
    Updated text prompt that directs the extension generation.  
    Constraints: minLength: 1, maxLength: 32000

  * `:seconds` - **required** - `ExOpenAI.Components.VideoSeconds.t()`  
    Length of the newly generated extension segment in seconds (allowed values: 4, 8, 12, 16, 20).

  * `:video` - **required** - `ExOpenAI.Components.VideoReferenceInputParam.t() | binary()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          prompt: String.t(),
          seconds: ExOpenAI.Components.VideoSeconds.t(),
          video: ExOpenAI.Components.VideoReferenceInputParam.t() | binary()
        }
  defstruct [:prompt, :seconds, :video]
end
