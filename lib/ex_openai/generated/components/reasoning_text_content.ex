defmodule ExOpenAI.Components.ReasoningTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  Reasoning text from the model.

  ## Fields

  * `:text` - **required** - `String.t()`  
    The reasoning text from the model.

  * `:type` - **required** - `:reasoning_text`  
    The type of the reasoning text. Always `reasoning_text`.  
    Allowed values: `"reasoning_text"`  
    Default: `"reasoning_text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :reasoning_text}
  defstruct [:text, :type]
end
