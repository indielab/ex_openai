defmodule ExOpenAI.Components.ResponseFormatTextGrammar do
  use ExOpenAI.Jason

  @moduledoc """
  A custom grammar for the model to follow when generating text.
  Learn more in the [custom grammars guide](/docs/guides/custom-grammars).


  ## Fields

  * `:grammar` - **required** - `String.t()`  
    The custom grammar for the model to follow.

  * `:type` - **required** - `:grammar`  
    The type of response format being defined. Always `grammar`.  
    Allowed values: `"grammar"`
  """
  @type t() :: %{__struct__: __MODULE__, grammar: String.t(), type: :grammar}
  defstruct [:grammar, :type]
end
