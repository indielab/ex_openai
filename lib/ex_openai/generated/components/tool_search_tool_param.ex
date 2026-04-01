defmodule ExOpenAI.Components.ToolSearchToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Hosted or BYOT tool search configuration for deferred tools.

  ## Fields

  * `:description` - **optional** - `String.t() | any()`

  * `:execution` - **optional** - `ExOpenAI.Components.ToolSearchExecutionType.t()`  
    Whether tool search is executed by the server or by the client.

  * `:parameters` - **optional** - `ExOpenAI.Components.EmptyModelParam.t() | any()`

  * `:type` - **required** - `:tool_search`  
    The type of the tool. Always `tool_search`.  
    Allowed values: `"tool_search"`  
    Default: `"tool_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | any()) | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t() | nil,
          parameters: (ExOpenAI.Components.EmptyModelParam.t() | any()) | nil,
          type: :tool_search
        }
  defstruct [:description, :execution, :parameters, :type]
end
