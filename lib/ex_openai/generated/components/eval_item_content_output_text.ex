defmodule ExOpenAI.Components.EvalItemContentOutputText do
  use ExOpenAI.Jason

  @moduledoc """
  A text output from the model.


  ## Fields

  * `:text` - **required** - `String.t()`  
    The text output from the model.

  * `:type` - **required** - `:output_text`  
    The type of the output text. Always `output_text`.  
    Allowed values: `"output_text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :output_text}
  defstruct [:text, :type]
end
