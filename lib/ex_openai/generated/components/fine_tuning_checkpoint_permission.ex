defmodule ExOpenAI.Components.FineTuningCheckpointPermission do
  use ExOpenAI.Jason

  @moduledoc """
  The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the permission was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The permission identifier, which can be referenced in the API endpoints.

  * `:object` - **required** - `:"checkpoint.permission"`
    The object type, which is always "checkpoint.permission".
    Allowed values: `"checkpoint.permission"`

  * `:project_id` - **required** - `String.t()`
    The project identifier that the permission is for.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"checkpoint.permission",
          project_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:object) => :"checkpoint.permission" | String.t(),
              required(:project_id) => String.t()
            }
  defstruct [:created_at, :id, :object, :project_id]
end
