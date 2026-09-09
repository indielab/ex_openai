defmodule ExOpenAI.Components.ProjectGroupListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of groups that have access to a project.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.ProjectGroup.t())`
    Project group memberships returned in the current page.

  * `:has_more` - **required** - `boolean()`
    Whether additional project group memberships are available.

  * `:next` - **required** - `String.t() | nil`
    Cursor to fetch the next page of results, or `null` when there are no more results.

  * `:object` - **required** - `:list`
    Always `list`.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ProjectGroup.t()),
          has_more: boolean(),
          next: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.ProjectGroup.input()),
              required(:has_more) => boolean(),
              required(:next) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :has_more, :next, :object]
end
