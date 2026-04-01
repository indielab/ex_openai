defmodule ExOpenAI.Components.CreateSkillBody do
  use ExOpenAI.Jason

  @moduledoc """
  Uploads a skill either as a directory (multipart `files[]`) or as a single zip file.

  ## Fields

  * `:files` - **required** - `[binary()] | binary()`
  """
  @type t() :: %{__struct__: __MODULE__, files: list(binary()) | binary()}
  defstruct [:files]
end
