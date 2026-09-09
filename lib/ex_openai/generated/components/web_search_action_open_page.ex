defmodule ExOpenAI.Components.WebSearchActionOpenPage do
  use ExOpenAI.Jason

  @moduledoc """
  Action type "open_page" - Opens a specific URL from search results.


  ## Fields

  * `:type` - **required** - `:open_page`
    The action type.
    Allowed values: `"open_page"`

  * `:url` - **optional** - `String.t() | nil`
    The URL opened by the model.
  """
  @type t() :: %{__struct__: __MODULE__, type: :open_page, url: (String.t() | nil) | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:type) => :open_page | String.t(), optional(:url) => String.t() | nil}
  defstruct [:type, :url]
end
