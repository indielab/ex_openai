defmodule ExOpenAI.Components.UserMessageQuotedText do
  use ExOpenAI.Jason

  @moduledoc """
  Quoted snippet that the user referenced in their message.

  ## Fields

  * `:text` - **required** - `String.t()`
    Quoted text content.

  * `:type` - **required** - `:quoted_text`
    Type discriminator that is always `quoted_text`.
    Allowed values: `"quoted_text"`
    Default: `"quoted_text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :quoted_text}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:text) => String.t(), required(:type) => :quoted_text | String.t()}
  defstruct [:text, :type]
end
