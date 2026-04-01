defmodule ExOpenAI.Components.InputTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  A text input to the model.

  ## Fields

  * `:text` - **required** - `String.t()`  
    The text input to the model.

  * `:type` - **required** - `:input_text`  
    The type of the input item. Always `input_text`.  
    Allowed values: `"input_text"`  
    Default: `"input_text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :input_text}
  defstruct [:text, :type]
end
