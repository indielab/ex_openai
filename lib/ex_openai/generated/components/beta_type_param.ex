defmodule ExOpenAI.Components.BetaTypeParam do
  use ExOpenAI.Jason

  @moduledoc """
  An action to type in text.

  ## Fields

  * `:text` - **required** - `String.t()`
    The text to type.

  * `:type` - **required** - `:type`
    Specifies the event type. For a type action, this property is always set to `type`.
    Allowed values: `"type"`
    Default: `"type"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :type}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:text) => String.t(), required(:type) => :type | String.t()}
  defstruct [:text, :type]
end
