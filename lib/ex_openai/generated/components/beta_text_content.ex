defmodule ExOpenAI.Components.BetaTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  A text content.

  ## Fields

  * `:text` - **required** - `String.t()`

  * `:type` - **required** - `:text`
    Allowed values: `"text"`
    Default: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :text}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:text) => String.t(), required(:type) => :text | String.t()}
  defstruct [:text, :type]
end
