defmodule ExOpenAI.Components.ToolChoiceCustom do
  use ExOpenAI.Jason

  @moduledoc """
  Use this option to force the model to call a specific custom tool.


  ## Fields

  * `:name` - **required** - `String.t()`  
    The name of the custom tool to call.

  * `:type` - **required** - `:custom`  
    For custom tool calling, the type is always `custom`.  
    Allowed values: `"custom"`
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t(), type: :custom}
  defstruct [:name, :type]
end
