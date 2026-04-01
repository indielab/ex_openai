defmodule ExOpenAI.Components.ResponseFormatText do
  use ExOpenAI.Jason

  @moduledoc """
  Default response format. Used to generate text responses.


  ## Fields

  * `:type` - **required** - `:text`  
    The type of response format being defined. Always `text`.  
    Allowed values: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :text}
  defstruct [:type]
end
