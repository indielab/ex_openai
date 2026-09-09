defmodule ExOpenAI.Components.ProjectSpendAlertDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting a project spend alert.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Whether the spend alert was deleted.

  * `:id` - **required** - `String.t()`
    The deleted spend alert ID.

  * `:object` - **required** - `:"project.spend_alert.deleted"`
    Always `project.spend_alert.deleted`.
    Allowed values: `"project.spend_alert.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"project.spend_alert.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"project.spend_alert.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
