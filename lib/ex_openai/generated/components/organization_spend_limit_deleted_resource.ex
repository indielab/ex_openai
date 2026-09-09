defmodule ExOpenAI.Components.OrganizationSpendLimitDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting an organization hard spend limit.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Whether the hard spend limit was deleted.

  * `:object` - **required** - `:"organization.spend_limit.deleted"`
    The object type, which is always `organization.spend_limit.deleted`.
    Allowed values: `"organization.spend_limit.deleted"`
    Default: `"organization.spend_limit.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          object: :"organization.spend_limit.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:object) => :"organization.spend_limit.deleted" | String.t()
            }
  defstruct [:deleted, :object]
end
