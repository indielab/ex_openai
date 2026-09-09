defmodule ExOpenAI.Components.SetDefaultSkillVersionBody do
  use ExOpenAI.Jason

  @moduledoc """
  Updates the default version pointer for a skill.

  ## Fields

  * `:default_version` - **required** - `String.t()`
    The skill version number to set as default.
  """
  @type t() :: %{__struct__: __MODULE__, default_version: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:default_version) => String.t()}
  defstruct [:default_version]
end
