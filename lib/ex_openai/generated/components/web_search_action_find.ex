defmodule ExOpenAI.Components.WebSearchActionFind do
  use ExOpenAI.Jason

  @moduledoc """
  Action type "find_in_page": Searches for a pattern within a loaded page.


  ## Fields

  * `:pattern` - **required** - `String.t()`
    The pattern or text to search for within the page.

  * `:type` - **required** - `:find_in_page`
    The action type.
    Allowed values: `"find_in_page"`

  * `:url` - **required** - `String.t()`
    The URL of the page searched for the pattern.
    Format: `uri`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          pattern: String.t(),
          type: :find_in_page,
          url: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:pattern) => String.t(),
              required(:type) => :find_in_page | String.t(),
              required(:url) => String.t()
            }
  defstruct [:pattern, :type, :url]
end
