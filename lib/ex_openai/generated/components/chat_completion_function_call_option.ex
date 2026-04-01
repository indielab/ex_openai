defmodule ExOpenAI.Components.ChatCompletionFunctionCallOption do
  use ExOpenAI.Jason

  @moduledoc """
  Specifying a particular function via `{"name": "my_function"}` forces the model to call that function.


  ## Fields

  * `:name` - **required** - `String.t()`  
    The name of the function to call.
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t()}
  defstruct [:name]
end
