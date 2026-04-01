defmodule ExOpenAI.Components.TextContent do
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
  defstruct [:text, :type]
end
