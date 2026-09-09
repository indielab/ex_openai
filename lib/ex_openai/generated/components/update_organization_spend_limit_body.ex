defmodule ExOpenAI.Components.UpdateOrganizationSpendLimitBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for the hard spend limit you want to create or replace.

  ## Fields

  * `:currency` - **required** - `:USD`
    The currency for the threshold amount. Currently, only `USD` is supported.
    Allowed values: `"USD"`

  * `:interval` - **required** - `:month`
    The time interval for evaluating spend against the threshold. Currently, only `month` is supported.
    Allowed values: `"month"`

  * `:threshold_amount` - **required** - `integer()`
    The hard spend limit amount, in cents.
    Constraints: minimum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          currency: :USD,
          interval: :month,
          threshold_amount: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:currency) => :USD | String.t(),
              required(:interval) => :month | String.t(),
              required(:threshold_amount) => integer()
            }
  defstruct [:currency, :interval, :threshold_amount]
end
