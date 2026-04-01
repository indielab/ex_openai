defmodule ExOpenAI.Components.ResponseFormatTextPython do
  use ExOpenAI.Jason

  @moduledoc """
  Configure the model to generate valid Python code. See the
  [custom grammars guide](/docs/guides/custom-grammars) for more details.


  ## Fields

  * `:type` - **required** - `:python`  
    The type of response format being defined. Always `python`.  
    Allowed values: `"python"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :python}
  defstruct [:type]
end
