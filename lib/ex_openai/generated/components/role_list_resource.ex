defmodule ExOpenAI.Components.RoleListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of roles assigned to a principal.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.AssignedRoleDetails.t()]`  
    Role assignments returned in the current page.

  * `:has_more` - **required** - `boolean()`  
    Whether additional assignments are available when paginating.

  * `:next` - **required** - `String.t() | any()`  
    Cursor to fetch the next page of results, or `null` when there are no more assignments.

  * `:object` - **required** - `:list`  
    Always `list`.  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.AssignedRoleDetails.t()),
          has_more: boolean(),
          next: String.t() | any(),
          object: :list
        }
  defstruct [:data, :has_more, :next, :object]
end
