defmodule ExOpenAI.Components.SkillResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SkillResource.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (seconds) for when the skill was created.

  * `:default_version` - **required** - `String.t()`  
    Default version for the skill.

  * `:description` - **required** - `String.t()`  
    Description of the skill.

  * `:id` - **required** - `String.t()`  
    Unique identifier for the skill.

  * `:latest_version` - **required** - `String.t()`  
    Latest version for the skill.

  * `:name` - **required** - `String.t()`  
    Name of the skill.

  * `:object` - **required** - `:skill`  
    The object type, which is `skill`.  
    Allowed values: `"skill"`  
    Default: `"skill"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          default_version: String.t(),
          description: String.t(),
          id: String.t(),
          latest_version: String.t(),
          name: String.t(),
          object: :skill
        }
  defstruct [:created_at, :default_version, :description, :id, :latest_version, :name, :object]
end
