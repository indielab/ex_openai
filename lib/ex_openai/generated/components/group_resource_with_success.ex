defmodule ExOpenAI.Components.GroupResourceWithSuccess do
  use ExOpenAI.Jason

  @moduledoc """
  Response returned after updating a group.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the group was created.  
    Format: `int64`

  * `:id` - **required** - `String.t()`  
    Identifier for the group.

  * `:is_scim_managed` - **required** - `boolean()`  
    Whether the group is managed through SCIM and controlled by your identity provider.

  * `:name` - **required** - `String.t()`  
    Updated display name for the group.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          is_scim_managed: boolean(),
          name: String.t()
        }
  defstruct [:created_at, :id, :is_scim_managed, :name]
end
