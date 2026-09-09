defmodule ExOpenAI.Components.SpendAlertNotificationChannel do
  use ExOpenAI.Jason

  @moduledoc """
  Email notification settings for a spend alert.

  ## Fields

  * `:recipients` - **required** - `list(String.t())`
    Email addresses that receive the spend alert notification.

  * `:subject_prefix` - **optional** - `String.t() | nil`
    Optional subject prefix for alert emails.

  * `:type` - **required** - `:email`
    The notification channel type. Currently only `email` is supported.
    Allowed values: `"email"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          recipients: list(String.t()),
          subject_prefix: (String.t() | nil) | nil,
          type: :email
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:recipients) => list(String.t()),
              optional(:subject_prefix) => String.t() | nil,
              required(:type) => :email | String.t()
            }
  defstruct [:recipients, :subject_prefix, :type]
end
