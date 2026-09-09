defmodule ExOpenAI.Components.ProjectSpendLimitDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting a project hard spend limit.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Whether the hard spend limit was deleted.

  * `:object` - **required** - `:"project.spend_limit.deleted"`
    The object type, which is always `project.spend_limit.deleted`.
    Allowed values: `"project.spend_limit.deleted"`
    Default: `"project.spend_limit.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          object: :"project.spend_limit.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:object) => :"project.spend_limit.deleted" | String.t()
            }
  defstruct [:deleted, :object]
end
