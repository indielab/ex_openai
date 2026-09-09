defmodule ExOpenAI.Components.ThreadListResource do
  use ExOpenAI.Jason

  @moduledoc """
  A paginated list of ChatKit threads.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.ThreadResource.t())`
    A list of items

  * `:first_id` - **required** - `String.t() | nil`

  * `:has_more` - **required** - `boolean()`
    Whether there are more items available.

  * `:last_id` - **required** - `String.t() | nil`

  * `:object` - **required** - `:list`
    The type of object returned, must be `list`.
    Allowed values: `"list"`
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ThreadResource.t()),
          first_id: String.t() | nil,
          has_more: boolean(),
          last_id: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.ThreadResource.input()),
              required(:first_id) => String.t() | nil,
              required(:has_more) => boolean(),
              required(:last_id) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
