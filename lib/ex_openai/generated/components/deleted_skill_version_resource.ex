defmodule ExOpenAI.Components.DeletedSkillVersionResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeletedSkillVersionResource.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"skill.version.deleted"`  
    Allowed values: `"skill.version.deleted"`  
    Default: `"skill.version.deleted"`

  * `:version` - **required** - `String.t()`  
    The deleted skill version.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"skill.version.deleted",
          version: String.t()
        }
  defstruct [:deleted, :id, :object, :version]
end
