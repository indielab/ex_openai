defmodule ExOpenAI.Components.CostsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated costs details of the specific time bucket.

  ## Fields

  * `:amount` - **optional** - `{:%{}, [], [{{:optional, [], [:currency]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:value]}, {:number, [], []}}]}`  
    The monetary value in its associated currency.

  * `:line_item` - **optional** - `String.t() | any()`

  * `:object` - **required** - `:"organization.costs.result"`  
    Allowed values: `"organization.costs.result"`

  * `:project_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          amount: %{optional(:currency) => String.t(), optional(:value) => number()} | nil,
          line_item: (String.t() | any()) | nil,
          object: :"organization.costs.result",
          project_id: (String.t() | any()) | nil
        }
  defstruct [:amount, :line_item, :object, :project_id]
end
