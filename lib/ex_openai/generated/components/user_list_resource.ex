defmodule ExOpenAI.Components.UserListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of user objects returned when inspecting group membership.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.GroupUser.t())`
    Users in the current page.

  * `:has_more` - **required** - `boolean()`
    Whether more users are available when paginating.

  * `:next` - **required** - `String.t() | nil`
    Cursor to fetch the next page of results, or `null` when no further users are available.

  * `:object` - **required** - `:list`
    Always `list`.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.GroupUser.t()),
          has_more: boolean(),
          next: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.GroupUser.input()),
              required(:has_more) => boolean(),
              required(:next) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :has_more, :next, :object]
end
