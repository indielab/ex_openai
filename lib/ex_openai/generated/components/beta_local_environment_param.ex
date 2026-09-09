defmodule ExOpenAI.Components.BetaLocalEnvironmentParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaLocalEnvironmentParam.

  ## Fields

  * `:skills` - **optional** - `list(ExOpenAI.Components.BetaLocalSkillParam.t())`
    An optional list of skills.
    Constraints: maxItems: 200

  * `:type` - **required** - `:local`
    Use a local computer environment.
    Allowed values: `"local"`
    Default: `"local"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          skills: list(ExOpenAI.Components.BetaLocalSkillParam.t()) | nil,
          type: :local
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:skills) => list(ExOpenAI.Components.BetaLocalSkillParam.input()),
              required(:type) => :local | String.t()
            }
  defstruct [:skills, :type]
end
