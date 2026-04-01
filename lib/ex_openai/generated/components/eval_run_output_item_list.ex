defmodule ExOpenAI.Components.EvalRunOutputItemList do
  use ExOpenAI.Jason

  @moduledoc """
  An object representing a list of output items for an evaluation run.


  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.EvalRunOutputItem.t()]`  
    An array of eval run output item objects.

  * `:first_id` - **required** - `String.t()`  
    The identifier of the first eval run output item in the data array.

  * `:has_more` - **required** - `boolean()`  
    Indicates whether there are more eval run output items available.

  * `:last_id` - **required** - `String.t()`  
    The identifier of the last eval run output item in the data array.

  * `:object` - **required** - `:list`  
    The type of this object. It is always set to "list".  
    Allowed values: `"list"`  
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.EvalRunOutputItem.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
