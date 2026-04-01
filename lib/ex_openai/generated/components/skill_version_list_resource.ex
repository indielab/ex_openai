defmodule ExOpenAI.Components.SkillVersionListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SkillVersionListResource.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.SkillVersionResource.t()]`  
    A list of items

  * `:first_id` - **required** - `String.t() | any()`

  * `:has_more` - **required** - `boolean()`  
    Whether there are more items available.

  * `:last_id` - **required** - `String.t() | any()`

  * `:object` - **required** - `:list`  
    The type of object returned, must be `list`.  
    Allowed values: `"list"`  
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.SkillVersionResource.t()),
          first_id: String.t() | any(),
          has_more: boolean(),
          last_id: String.t() | any(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
