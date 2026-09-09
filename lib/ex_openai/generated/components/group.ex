defmodule ExOpenAI.Components.Group do
  use ExOpenAI.Jason

  @moduledoc """
  Summary information about a group returned in role assignment responses.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) when the group was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier for the group.

  * `:name` - **required** - `String.t()`
    Display name of the group.

  * `:object` - **required** - `:group`
    Always `group`.
    Allowed values: `"group"`

  * `:scim_managed` - **required** - `boolean()`
    Whether the group is managed through SCIM.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :group,
          scim_managed: boolean()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:object) => :group | String.t(),
              required(:scim_managed) => boolean()
            }
  defstruct [:created_at, :id, :name, :object, :scim_managed]
end
