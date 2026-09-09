defmodule ExOpenAI.Components.ResponseFormatTextGrammar do
  use ExOpenAI.Jason

  @moduledoc """
  A custom grammar for the model to follow when generating text.
  Learn more in the [custom grammars guide](https://platform.openai.com/docs/guides/custom-grammars).


  ## Fields

  * `:grammar` - **required** - `String.t()`
    The custom grammar for the model to follow.

  * `:type` - **required** - `:grammar`
    The type of response format being defined. Always `grammar`.
    Allowed values: `"grammar"`
  """
  @type t() :: %{__struct__: __MODULE__, grammar: String.t(), type: :grammar}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:grammar) => String.t(), required(:type) => :grammar | String.t()}
  defstruct [:grammar, :type]
end
