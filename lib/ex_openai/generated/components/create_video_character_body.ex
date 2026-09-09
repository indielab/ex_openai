defmodule ExOpenAI.Components.CreateVideoCharacterBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for creating a character from an uploaded video.

  ## Fields

  * `:name` - **required** - `String.t()`
    Display name for this API character.
    Constraints: minLength: 1, maxLength: 80

  * `:video` - **required** - `binary()`
    Video file used to create a character.
    Format: `binary`
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t(), video: binary()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:name) => String.t(),
              required(:video) => binary() | {String.t(), binary()}
            }
  defstruct [:name, :video]
end
