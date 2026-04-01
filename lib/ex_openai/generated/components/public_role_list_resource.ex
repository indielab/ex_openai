defmodule ExOpenAI.Components.PublicRoleListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of roles available on an organization or project.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.Role.t()]`  
    Roles returned in the current page.

  * `:has_more` - **required** - `boolean()`  
    Whether more roles are available when paginating.

  * `:next` - **required** - `String.t() | any()`  
    Cursor to fetch the next page of results, or `null` when there are no additional roles.

  * `:object` - **required** - `:list`  
    Always `list`.  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.Role.t()),
          has_more: boolean(),
          next: String.t() | any(),
          object: :list
        }
  defstruct [:data, :has_more, :next, :object]
end
