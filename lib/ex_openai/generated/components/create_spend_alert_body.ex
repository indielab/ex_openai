defmodule ExOpenAI.Components.CreateSpendAlertBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for creating or updating a spend alert.

  ## Fields

  * `:currency` - **required** - `:USD`
    The currency for the threshold amount.
    Allowed values: `"USD"`

  * `:interval` - **required** - `:month`
    The time interval for evaluating spend against the threshold.
    Allowed values: `"month"`

  * `:notification_channel` - **required** - `ExOpenAI.Components.SpendAlertNotificationChannel.t()`

  * `:threshold_amount` - **required** - `integer()`
    The alert threshold amount, in cents.
    Constraints: minimum: 0
  """
  @type t() :: %{
          __struct__: __MODULE__,
          currency: :USD,
          interval: :month,
          notification_channel: ExOpenAI.Components.SpendAlertNotificationChannel.t(),
          threshold_amount: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:currency) => :USD | String.t(),
              required(:interval) => :month | String.t(),
              required(:notification_channel) =>
                ExOpenAI.Components.SpendAlertNotificationChannel.input(),
              required(:threshold_amount) => integer()
            }
  defstruct [:currency, :interval, :notification_channel, :threshold_amount]
end
