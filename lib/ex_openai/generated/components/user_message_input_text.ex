defmodule ExOpenAI.Components.UserMessageInputText do
  use ExOpenAI.Jason

  @moduledoc """
  Text block that a user contributed to the thread.

  ## Fields

  * `:text` - **required** - `String.t()`
    Plain-text content supplied by the user.

  * `:type` - **required** - `:input_text`
    Type discriminator that is always `input_text`.
    Allowed values: `"input_text"`
    Default: `"input_text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :input_text}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:text) => String.t(), required(:type) => :input_text | String.t()}
  defstruct [:text, :type]
end
