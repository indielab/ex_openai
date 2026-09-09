defmodule ExOpenAI.Components.ResponseFormatTextPython do
  use ExOpenAI.Jason

  @moduledoc """
  Configure the model to generate valid Python code. See the
  [custom grammars guide](https://platform.openai.com/docs/guides/custom-grammars) for more details.


  ## Fields

  * `:type` - **required** - `:python`
    The type of response format being defined. Always `python`.
    Allowed values: `"python"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :python}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :python | String.t()}
  defstruct [:type]
end
