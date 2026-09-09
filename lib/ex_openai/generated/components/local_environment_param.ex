defmodule ExOpenAI.Components.LocalEnvironmentParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema LocalEnvironmentParam.

  ## Fields

  * `:skills` - **optional** - `list(ExOpenAI.Components.LocalSkillParam.t())`
    An optional list of skills.
    Constraints: maxItems: 200

  * `:type` - **required** - `:local`
    Use a local computer environment.
    Allowed values: `"local"`
    Default: `"local"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          skills: list(ExOpenAI.Components.LocalSkillParam.t()) | nil,
          type: :local
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:skills) => list(ExOpenAI.Components.LocalSkillParam.input()),
              required(:type) => :local | String.t()
            }
  defstruct [:skills, :type]
end
