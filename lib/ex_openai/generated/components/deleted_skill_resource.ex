defmodule ExOpenAI.Components.DeletedSkillResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeletedSkillResource.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"skill.deleted"`
    Allowed values: `"skill.deleted"`
    Default: `"skill.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"skill.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"skill.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
