defmodule ExOpenAI.Components.RoleListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of roles assigned to a principal.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.AssignedRoleDetails.t())`
    Role assignments returned in the current page.

  * `:has_more` - **required** - `boolean()`
    Whether additional assignments are available when paginating.

  * `:next` - **required** - `String.t() | nil`
    Cursor to fetch the next page of results, or `null` when there are no more assignments.

  * `:object` - **required** - `:list`
    Always `list`.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.AssignedRoleDetails.t()),
          has_more: boolean(),
          next: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.AssignedRoleDetails.input()),
              required(:has_more) => boolean(),
              required(:next) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :has_more, :next, :object]
end
