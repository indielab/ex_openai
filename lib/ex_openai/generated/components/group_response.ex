defmodule ExOpenAI.Components.GroupResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Details about an organization group.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) when the group was created.
    Format: `unixtime`

  * `:group_type` - **required** - `:group | :tenant_group`
    The type of the group.
    Allowed values: `"group"`, `"tenant_group"`

  * `:id` - **required** - `String.t()`
    Identifier for the group.

  * `:is_scim_managed` - **required** - `boolean()`
    Whether the group is managed through SCIM and controlled by your identity provider.

  * `:name` - **required** - `String.t()`
    Display name of the group.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          group_type: :group | :tenant_group,
          id: String.t(),
          is_scim_managed: boolean(),
          name: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:group_type) => (:group | :tenant_group) | String.t(),
              required(:id) => String.t(),
              required(:is_scim_managed) => boolean(),
              required(:name) => String.t()
            }
  defstruct [:created_at, :group_type, :id, :is_scim_managed, :name]
end
