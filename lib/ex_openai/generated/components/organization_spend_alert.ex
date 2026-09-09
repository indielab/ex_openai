defmodule ExOpenAI.Components.OrganizationSpendAlert do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a spend alert configured at the organization level.

  ## Fields

  * `:currency` - **required** - `:USD`
    The currency for the threshold amount.
    Allowed values: `"USD"`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints.

  * `:interval` - **required** - `:month`
    The time interval for evaluating spend against the threshold.
    Allowed values: `"month"`

  * `:notification_channel` - **required** - `ExOpenAI.Components.SpendAlertNotificationChannel.t()`

  * `:object` - **required** - `:"organization.spend_alert"`
    The object type, which is always `organization.spend_alert`.
    Allowed values: `"organization.spend_alert"`

  * `:threshold_amount` - **required** - `integer()`
    The alert threshold amount, in cents.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          currency: :USD,
          id: String.t(),
          interval: :month,
          notification_channel: ExOpenAI.Components.SpendAlertNotificationChannel.t(),
          object: :"organization.spend_alert",
          threshold_amount: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:currency) => :USD | String.t(),
              required(:id) => String.t(),
              required(:interval) => :month | String.t(),
              required(:notification_channel) =>
                ExOpenAI.Components.SpendAlertNotificationChannel.input(),
              required(:object) => :"organization.spend_alert" | String.t(),
              required(:threshold_amount) => integer()
            }
  defstruct [:currency, :id, :interval, :notification_channel, :object, :threshold_amount]
end
