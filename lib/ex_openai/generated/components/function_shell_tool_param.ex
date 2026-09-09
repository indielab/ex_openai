defmodule ExOpenAI.Components.FunctionShellToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that allows the model to execute shell commands.

  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil`

  * `:environment` - **optional** - `ExOpenAI.Components.ContainerAutoParam.t() | ExOpenAI.Components.LocalEnvironmentParam.t() | ExOpenAI.Components.ContainerReferenceParam.t() | nil`

  * `:type` - **required** - `:shell`
    The type of the shell tool. Always `shell`.
    Allowed values: `"shell"`
    Default: `"shell"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_callers: (list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil) | nil,
          environment:
            (((ExOpenAI.Components.ContainerAutoParam.t()
               | ExOpenAI.Components.LocalEnvironmentParam.t())
              | ExOpenAI.Components.ContainerReferenceParam.t())
             | nil)
            | nil,
          type: :shell
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:allowed_callers) =>
                list(ExOpenAI.Components.CallableToolAllowedCaller.input()) | nil,
              optional(:environment) =>
                ((ExOpenAI.Components.ContainerAutoParam.input()
                  | ExOpenAI.Components.LocalEnvironmentParam.input())
                 | ExOpenAI.Components.ContainerReferenceParam.input())
                | nil,
              required(:type) => :shell | String.t()
            }
  defstruct [:allowed_callers, :environment, :type]
end
