defmodule ExOpenAI.Components.VectorStoreSearchResultContentObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VectorStoreSearchResultContentObject.

  ## Fields

  * `:text` - **required** - `String.t()`  
    The text content returned from search.

  * `:type` - **required** - `:text`  
    The type of content.  
    Allowed values: `"text"`
  """
  @type t() :: %{__struct__: __MODULE__, text: String.t(), type: :text}
  defstruct [:text, :type]
end
