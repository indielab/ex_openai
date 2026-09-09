defmodule ExOpenAI.Components.BetaCompoundFilter do
  use ExOpenAI.Jason

  @moduledoc """
  Combine multiple filters using `and` or `or`.

  ## Fields

  * `:filters` - **required** - `list(ExOpenAI.Components.BetaComparisonFilter.t() | any())`
    Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.

  * `:type` - **required** - `:and | :or`
    Type of operation: `and` or `or`.
    Allowed values: `"and"`, `"or"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          filters: list(ExOpenAI.Components.BetaComparisonFilter.t() | any()),
          type: :and | :or
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:filters) =>
                list(ExOpenAI.Components.BetaComparisonFilter.input() | any()),
              required(:type) => (:and | :or) | String.t()
            }
  defstruct [:filters, :type]
end
