defmodule ExOpenAI.Components.SummaryTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  A summary text from the model.

  ## Fields

  * `:text` - **required** - `String.t()`  
    A summary of the reasoning output from the model so far.

  * `:type` - **required** - `:summary_text`  
    The type of the object. Always `summary_text`.  
    Allowed values: `"summary_text"`  
    Default: `"summary_text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :summary_text}
  defstruct [:text, :type]
end
