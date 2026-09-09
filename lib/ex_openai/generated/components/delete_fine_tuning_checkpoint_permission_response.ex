defmodule ExOpenAI.Components.DeleteFineTuningCheckpointPermissionResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteFineTuningCheckpointPermissionResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Whether the fine-tuned model checkpoint permission was successfully deleted.

  * `:id` - **required** - `String.t()`
    The ID of the fine-tuned model checkpoint permission that was deleted.

  * `:object` - **required** - `:"checkpoint.permission"`
    The object type, which is always "checkpoint.permission".
    Allowed values: `"checkpoint.permission"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"checkpoint.permission"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"checkpoint.permission" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
