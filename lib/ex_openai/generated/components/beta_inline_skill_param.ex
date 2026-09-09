defmodule ExOpenAI.Components.BetaInlineSkillParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaInlineSkillParam.

  ## Fields

  * `:description` - **required** - `String.t()`
    The description of the skill.

  * `:name` - **required** - `String.t()`
    The name of the skill.

  * `:source` - **required** - `ExOpenAI.Components.BetaInlineSkillSourceParam.t()`
    Inline skill payload

  * `:type` - **required** - `:inline`
    Defines an inline skill for this request.
    Allowed values: `"inline"`
    Default: `"inline"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t(),
          name: String.t(),
          source: ExOpenAI.Components.BetaInlineSkillSourceParam.t(),
          type: :inline
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:description) => String.t(),
              required(:name) => String.t(),
              required(:source) => ExOpenAI.Components.BetaInlineSkillSourceParam.input(),
              required(:type) => :inline | String.t()
            }
  defstruct [:description, :name, :source, :type]
end
