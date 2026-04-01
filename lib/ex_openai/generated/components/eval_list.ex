defmodule ExOpenAI.Components.EvalList do
  use ExOpenAI.Jason

  @moduledoc """
  An object representing a list of evals.


  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.Eval.t()]`  
    An array of eval objects.

  * `:first_id` - **required** - `String.t()`  
    The identifier of the first eval in the data array.

  * `:has_more` - **required** - `boolean()`  
    Indicates whether there are more evals available.

  * `:last_id` - **required** - `String.t()`  
    The identifier of the last eval in the data array.

  * `:object` - **required** - `:list`  
    The type of this object. It is always set to "list".  
    Allowed values: `"list"`  
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.Eval.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
