defmodule ExOpenAI.Components.SkillListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SkillListResource.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.SkillResource.t())`
    A list of items

  * `:first_id` - **required** - `String.t() | nil`

  * `:has_more` - **required** - `boolean()`
    Whether there are more items available.

  * `:last_id` - **required** - `String.t() | nil`

  * `:object` - **required** - `:list`
    The type of object returned, must be `list`.
    Allowed values: `"list"`
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.SkillResource.t()),
          first_id: String.t() | nil,
          has_more: boolean(),
          last_id: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.SkillResource.input()),
              required(:first_id) => String.t() | nil,
              required(:has_more) => boolean(),
              required(:last_id) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
