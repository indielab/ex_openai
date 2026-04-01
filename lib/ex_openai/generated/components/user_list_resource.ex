defmodule ExOpenAI.Components.UserListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of user objects returned when inspecting group membership.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.User.t()]`  
    Users in the current page.

  * `:has_more` - **required** - `boolean()`  
    Whether more users are available when paginating.

  * `:next` - **required** - `String.t() | any()`  
    Cursor to fetch the next page of results, or `null` when no further users are available.

  * `:object` - **required** - `:list`  
    Always `list`.  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.User.t()),
          has_more: boolean(),
          next: String.t() | any(),
          object: :list
        }
  defstruct [:data, :has_more, :next, :object]
end
