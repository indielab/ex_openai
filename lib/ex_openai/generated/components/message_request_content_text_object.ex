defmodule ExOpenAI.Components.MessageRequestContentTextObject do
  use ExOpenAI.Jason

  @moduledoc """
  The text content that is part of a message.

  ## Fields

  * `:text` - **required** - `String.t()`
    Text content to be sent to the model

  * `:type` - **required** - `:text`
    Always `text`.
    Allowed values: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :text}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:text) => String.t(), required(:type) => :text | String.t()}
  defstruct [:text, :type]
end
