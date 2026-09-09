defmodule ExOpenAI.Components.OrganizationSpendLimitResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a hard spend limit configured at the organization level.

  ## Fields

  * `:currency` - **required** - `ExOpenAI.Components.SpendLimitCurrency.t()`
    The currency for the threshold amount. Currently, only `USD` is supported.

  * `:enforcement` - **required** - `ExOpenAI.Components.SpendLimitEnforcement.t()`
    The current enforcement state of the hard spend limit.

  * `:interval` - **required** - `ExOpenAI.Components.SpendLimitInterval.t()`
    The time interval for evaluating spend against the threshold. Currently, only `month` is supported.

  * `:object` - **required** - `:"organization.spend_limit"`
    The object type, which is always `organization.spend_limit`.
    Allowed values: `"organization.spend_limit"`
    Default: `"organization.spend_limit"`

  * `:threshold_amount` - **required** - `integer()`
    The hard spend limit amount, in cents.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          currency: ExOpenAI.Components.SpendLimitCurrency.t(),
          enforcement: ExOpenAI.Components.SpendLimitEnforcement.t(),
          interval: ExOpenAI.Components.SpendLimitInterval.t(),
          object: :"organization.spend_limit",
          threshold_amount: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:currency) => ExOpenAI.Components.SpendLimitCurrency.input(),
              required(:enforcement) => ExOpenAI.Components.SpendLimitEnforcement.input(),
              required(:interval) => ExOpenAI.Components.SpendLimitInterval.input(),
              required(:object) => :"organization.spend_limit" | String.t(),
              required(:threshold_amount) => integer()
            }
  defstruct [:currency, :enforcement, :interval, :object, :threshold_amount]
end
