defmodule ExOpenAI.Components.BetaNamespaceToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Groups function/custom tools under a shared namespace.

  ## Fields

  * `:description` - **required** - `String.t()`
    A description of the namespace shown to the model.
    Constraints: minLength: 1

  * `:name` - **required** - `String.t()`
    The namespace name used in tool calls (for example, `crm`).
    Constraints: minLength: 1

  * `:tools` - **required** - `list(ExOpenAI.Components.BetaFunctionToolParam.t() | ExOpenAI.Components.BetaCustomToolParam.t())`
    The function/custom tools available inside this namespace.
    Constraints: minItems: 1

  * `:type` - **required** - `:namespace`
    The type of the tool. Always `namespace`.
    Allowed values: `"namespace"`
    Default: `"namespace"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t(),
          name: String.t(),
          tools:
            list(
              ExOpenAI.Components.BetaFunctionToolParam.t()
              | ExOpenAI.Components.BetaCustomToolParam.t()
            ),
          type: :namespace
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:description) => String.t(),
              required(:name) => String.t(),
              required(:tools) =>
                list(
                  ExOpenAI.Components.BetaFunctionToolParam.input()
                  | ExOpenAI.Components.BetaCustomToolParam.input()
                ),
              required(:type) => :namespace | String.t()
            }
  defstruct [:description, :name, :tools, :type]
end
