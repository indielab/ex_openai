defmodule ExOpenAI.Components.CreateSkillVersionBody do
  use ExOpenAI.Jason

  @moduledoc """
  Uploads a new immutable version of a skill.

  ## Fields

  * `:default` - **optional** - `boolean()`
    Whether to set this version as the default.

  * `:files` - **required** - `list(binary()) | binary()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          default: boolean() | nil,
          files: list(binary()) | binary()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:default) => boolean(),
              required(:files) =>
                list(binary() | {String.t(), binary()}) | binary() | {String.t(), binary()}
            }
  defstruct [:default, :files]
end
