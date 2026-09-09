defmodule ExOpenAI.Components.OrganizationSpendAlertListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Paginated list of organization spend alerts.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.OrganizationSpendAlert.t())`
    Spend alerts returned in the current page.

  * `:first_id` - **required** - `String.t() | nil`
    The ID of the first spend alert in this page.

  * `:has_more` - **required** - `boolean()`
    Whether more spend alerts are available when paginating.

  * `:last_id` - **required** - `String.t() | nil`
    The ID of the last spend alert in this page.

  * `:object` - **required** - `:list`
    Always `list`.
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.OrganizationSpendAlert.t()),
          first_id: String.t() | nil,
          has_more: boolean(),
          last_id: String.t() | nil,
          object: :list
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.OrganizationSpendAlert.input()),
              required(:first_id) => String.t() | nil,
              required(:has_more) => boolean(),
              required(:last_id) => String.t() | nil,
              required(:object) => :list | String.t()
            }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
