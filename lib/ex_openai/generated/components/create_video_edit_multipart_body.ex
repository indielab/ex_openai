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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:prompt) => String.t(),
              required(:video) =>
                (binary() | {String.t(), binary()})
                | ExOpenAI.Components.VideoReferenceInputParam.input()
            }
  defstruct [:prompt, :video]
end
