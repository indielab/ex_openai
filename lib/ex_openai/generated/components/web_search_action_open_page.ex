defmodule ExOpenAI.Components.WebSearchActionOpenPage do
  use ExOpenAI.Jason

  @moduledoc """
  Action type "open_page" - Opens a specific URL from search results.


  ## Fields

  * `:type` - **required** - `:open_page`  
    The action type.  
    Allowed values: `"open_page"`

  * `:url` - **optional** - `String.t() | any()`  
    The URL opened by the model.
  """
  @type t() :: %{__struct__: __MODULE__, type: :open_page, url: (String.t() | any()) | nil}
  defstruct [:type, :url]
end
