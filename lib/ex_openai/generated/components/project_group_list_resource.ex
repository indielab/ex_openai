defmodule ExOpenAI.Components.ProjectGroupListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of groups that have access to a project.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.ProjectGroup.t()]`  
    Project group memberships returned in the current page.

  * `:has_more` - **required** - `boolean()`  
    Whether additional project group memberships are available.

  * `:next` - **required** - `String.t() | any()`  
    Cursor to fetch the next page of results, or `null` when there are no more results.

  * `:object` - **required** - `:list`  
    Always `list`.  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ProjectGroup.t()),
          has_more: boolean(),
          next: String.t() | any(),
          object: :list
        }
  defstruct [:data, :has_more, :next, :object]
end
