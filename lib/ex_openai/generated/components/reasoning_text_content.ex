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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:text) => String.t(), required(:type) => :reasoning_text | String.t()}
  defstruct [:text, :type]
end
