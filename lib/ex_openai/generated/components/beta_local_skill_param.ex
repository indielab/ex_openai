defmodule ExOpenAI.Components.BetaLocalSkillParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaLocalSkillParam.

  ## Fields

  * `:description` - **required** - `String.t()`
    The description of the skill.

  * `:name` - **required** - `String.t()`
    The name of the skill.

  * `:path` - **required** - `String.t()`
    The path to the directory containing the skill.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t(),
          name: String.t(),
          path: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:description) => String.t(),
              required(:name) => String.t(),
              required(:path) => String.t()
            }
  defstruct [:description, :name, :path]
end
