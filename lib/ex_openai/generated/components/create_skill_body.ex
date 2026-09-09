defmodule ExOpenAI.Components.CreateSkillBody do
  use ExOpenAI.Jason

  @moduledoc """
  Uploads a skill either as a directory (multipart `files[]`) or as a single zip file.

  ## Fields

  * `:files` - **required** - `list(binary()) | binary()`
  """
  @type t() :: %{__struct__: __MODULE__, files: list(binary()) | binary()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:files) =>
                list(binary() | {String.t(), binary()}) | binary() | {String.t(), binary()}
            }
  defstruct [:files]
end
