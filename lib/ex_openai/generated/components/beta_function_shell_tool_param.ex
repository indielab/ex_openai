defmodule ExOpenAI.Components.BetaFunctionShellToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that allows the model to execute shell commands.

  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.BetaCallableToolAllowedCaller.t()) | nil`

  * `:environment` - **optional** - `ExOpenAI.Components.BetaContainerAutoParam.t() | ExOpenAI.Components.BetaLocalEnvironmentParam.t() | ExOpenAI.Components.BetaContainerReferenceParam.t() | nil`

  * `:type` - **required** - `:shell`
    The type of the shell tool. Always `shell`.
    Allowed values: `"shell"`
    Default: `"shell"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_callers:
            (list(ExOpenAI.Components.BetaCallableToolAllowedCaller.t()) | nil) | nil,
          environment:
            (((ExOpenAI.Components.BetaContainerAutoParam.t()
               | ExOpenAI.Components.BetaLocalEnvironmentParam.t())
              | ExOpenAI.Components.BetaContainerReferenceParam.t())
             | nil)
            | nil,
          type: :shell
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:allowed_callers) =>
                list(ExOpenAI.Components.BetaCallableToolAllowedCaller.input()) | nil,
              optional(:environment) =>
                ((ExOpenAI.Components.BetaContainerAutoParam.input()
                  | ExOpenAI.Components.BetaLocalEnvironmentParam.input())
                 | ExOpenAI.Components.BetaContainerReferenceParam.input())
                | nil,
              required(:type) => :shell | String.t()
            }
  defstruct [:allowed_callers, :environment, :type]
end
