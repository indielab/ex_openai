defmodule ExOpenAI.Components.RefusalContent do
  use ExOpenAI.Jason

  @moduledoc """
  A refusal from the model.

  ## Fields

  * `:refusal` - **required** - `String.t()`  
    The refusal explanation from the model.

  * `:type` - **required** - `:refusal`  
    The type of the refusal. Always `refusal`.  
    Allowed values: `"refusal"`  
    Default: `"refusal"`
  """
  @type t() :: %{__struct__: __MODULE__, refusal: String.t(), type: :refusal}
  defstruct [:refusal, :type]
end
