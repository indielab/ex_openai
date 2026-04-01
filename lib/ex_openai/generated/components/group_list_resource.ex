defmodule ExOpenAI.Components.GroupListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of organization groups.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.GroupResponse.t()]`  
    Groups returned in the current page.

  * `:has_more` - **required** - `boolean()`  
    Whether additional groups are available when paginating.

  * `:next` - **required** - `String.t() | any()`  
    Cursor to fetch the next page of results, or `null` if there are no more results.

  * `:object` - **required** - `:list`  
    Always `list`.  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.GroupResponse.t()),
          has_more: boolean(),
          next: String.t() | any(),
          object: :list
        }
  defstruct [:data, :has_more, :next, :object]
end
