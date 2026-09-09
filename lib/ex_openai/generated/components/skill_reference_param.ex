defmodule ExOpenAI.Components.SkillReferenceParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SkillReferenceParam.

  ## Fields

  * `:skill_id` - **required** - `String.t()`
    The ID of the referenced skill.
    Constraints: minLength: 1, maxLength: 64

  * `:type` - **required** - `:skill_reference`
    References a skill created with the /v1/skills endpoint.
    Allowed values: `"skill_reference"`
    Default: `"skill_reference"`

  * `:version` - **optional** - `String.t()`
    Optional skill version. Use a positive integer or 'latest'. Omit for default.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          skill_id: String.t(),
          type: :skill_reference,
          version: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:skill_id) => String.t(),
              required(:type) => :skill_reference | String.t(),
              optional(:version) => String.t()
            }
  defstruct [:skill_id, :type, :version]
end
