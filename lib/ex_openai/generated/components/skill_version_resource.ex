defmodule ExOpenAI.Components.SkillVersionResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SkillVersionResource.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (seconds) for when the version was created.
    Format: `unixtime`

  * `:description` - **required** - `String.t()`
    Description of the skill version.

  * `:id` - **required** - `String.t()`
    Unique identifier for the skill version.

  * `:name` - **required** - `String.t()`
    Name of the skill version.

  * `:object` - **required** - `:"skill.version"`
    The object type, which is `skill.version`.
    Allowed values: `"skill.version"`
    Default: `"skill.version"`

  * `:skill_id` - **required** - `String.t()`
    Identifier of the skill for this version.

  * `:version` - **required** - `String.t()`
    Version number for this skill.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          description: String.t(),
          id: String.t(),
          name: String.t(),
          object: :"skill.version",
          skill_id: String.t(),
          version: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:description) => String.t(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:object) => :"skill.version" | String.t(),
              required(:skill_id) => String.t(),
              required(:version) => String.t()
            }
  defstruct [:created_at, :description, :id, :name, :object, :skill_id, :version]
end
