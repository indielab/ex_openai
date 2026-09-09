defmodule ExOpenAI.Components.BetaToolSearchToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Hosted or BYOT tool search configuration for deferred tools.

  ## Fields

  * `:description` - **optional** - `String.t() | nil`

  * `:execution` - **optional** - `ExOpenAI.Components.BetaToolSearchExecutionType.t()`
    Whether tool search is executed by the server or by the client.

  * `:parameters` - **optional** - `ExOpenAI.Components.BetaEmptyModelParam.t() | nil`

  * `:type` - **required** - `:tool_search`
    The type of the tool. Always `tool_search`.
    Allowed values: `"tool_search"`
    Default: `"tool_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | nil) | nil,
          execution: ExOpenAI.Components.BetaToolSearchExecutionType.t() | nil,
          parameters: (ExOpenAI.Components.BetaEmptyModelParam.t() | nil) | nil,
          type: :tool_search
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:description) => String.t() | nil,
              optional(:execution) => ExOpenAI.Components.BetaToolSearchExecutionType.input(),
              optional(:parameters) => ExOpenAI.Components.BetaEmptyModelParam.input() | nil,
              required(:type) => :tool_search | String.t()
            }
  defstruct [:description, :execution, :parameters, :type]
end
