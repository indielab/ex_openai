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
  defstruct [:text, :type]
end
