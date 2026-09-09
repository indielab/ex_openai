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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:prompt) => String.t(),
              required(:video) => ExOpenAI.Components.VideoReferenceInputParam.input()
            }
  defstruct [:prompt, :video]
end
