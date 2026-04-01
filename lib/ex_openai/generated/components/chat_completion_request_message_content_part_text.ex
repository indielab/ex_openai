defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartText do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [text inputs](/docs/guides/text-generation).


  ## Fields

  * `:text` - **required** - `String.t()`  
    The text content.

  * `:type` - **required** - `:text`  
    The type of the content part.  
    Allowed values: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :text}
  defstruct [:text, :type]
end
