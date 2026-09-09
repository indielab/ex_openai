defmodule ExOpenAI.Components.GroupListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of organization groups.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.GroupResponse.t())`
    Groups returned in the current page.

  * `:has_more` - **required** - `boolean()`
    Whether additional groups are available when paginating.

  * `:next` - **required** - `String.t() | nil`
    Cursor to fetch the next page of results, or `null` if there are no more results.

  * `:object` - **required** - `:list`
    Always `list`.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.GroupResponse.t()),
          has_more: boolean(),
          next: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.GroupResponse.input()),
              required(:has_more) => boolean(),
              required(:next) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :has_more, :next, :object]
end
