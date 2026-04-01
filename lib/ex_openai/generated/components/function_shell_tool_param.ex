defmodule ExOpenAI.Components.FunctionShellToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that allows the model to execute shell commands.

  ## Fields

  * `:environment` - **optional** - `ExOpenAI.Components.ContainerAutoParam.t() | ExOpenAI.Components.LocalEnvironmentParam.t() | ExOpenAI.Components.ContainerReferenceParam.t() | any()`

  * `:type` - **required** - `:shell`  
    The type of the shell tool. Always `shell`.  
    Allowed values: `"shell"`  
    Default: `"shell"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          environment:
            (((ExOpenAI.Components.ContainerAutoParam.t()
               | ExOpenAI.Components.LocalEnvironmentParam.t())
              | ExOpenAI.Components.ContainerReferenceParam.t())
             | any())
            | nil,
          type: :shell
        }
  defstruct [:environment, :type]
end
