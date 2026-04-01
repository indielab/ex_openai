defmodule ExOpenAI.Components.CreateSkillVersionBody do
  use ExOpenAI.Jason

  @moduledoc """
  Uploads a new immutable version of a skill.

  ## Fields

  * `:default` - **optional** - `boolean()`  
    Whether to set this version as the default.

  * `:files` - **required** - `[binary()] | binary()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          default: boolean() | nil,
          files: list(binary()) | binary()
        }
  defstruct [:default, :files]
end
