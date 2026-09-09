defmodule ExOpenAI.Components.CostsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated costs details of the specific time bucket.

  ## Fields

  * `:amount` - **optional** - `%{optional(:currency) => String.t(), optional(:value) => number()}`
    The monetary value in its associated currency.

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:line_item` - **optional** - `String.t() | nil`

  * `:object` - **required** - `:"organization.costs.result"`
    Allowed values: `"organization.costs.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:quantity` - **optional** - `number() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          amount: %{optional(:currency) => String.t(), optional(:value) => number()} | nil,
          api_key_id: (String.t() | nil) | nil,
          line_item: (String.t() | nil) | nil,
          object: :"organization.costs.result",
          project_id: (String.t() | nil) | nil,
          quantity: (number() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:amount) => %{
                optional(:currency) => String.t(),
                optional(:value) => number()
              },
              optional(:api_key_id) => String.t() | nil,
              optional(:line_item) => String.t() | nil,
              required(:object) => :"organization.costs.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              optional(:quantity) => number() | nil
            }
  defstruct [:amount, :api_key_id, :line_item, :object, :project_id, :quantity]
end
