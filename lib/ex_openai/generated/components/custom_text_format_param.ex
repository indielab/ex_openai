defmodule ExOpenAI.Components.CustomTextFormatParam do
  use ExOpenAI.Jason

  @moduledoc """
  Unconstrained free-form text.

  ## Fields

  * `:type` - **required** - `:text`  
    Unconstrained text format. Always `text`.  
    Allowed values: `"text"`  
    Default: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :text}
  defstruct [:type]
end
