defmodule ExOpenAI.Components.ToolSearchOutput do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchOutput.

  ## Fields

  * `:call_id` - **required** - `String.t() | any()`

  * `:created_by` - **optional** - `String.t()`  
    The identifier of the actor that created the item.

  * `:execution` - **required** - `ExOpenAI.Components.ToolSearchExecutionType.t()`  
    Whether tool search was executed by the server or by the client.

  * `:id` - **required** - `String.t()`  
    The unique ID of the tool search output item.

  * `:status` - **required** - `ExOpenAI.Components.FunctionCallOutputStatusEnum.t()`  
    The status of the tool search output item that was recorded.

  * `:tools` - **required** - `[ExOpenAI.Components.Tool.t()]`  
    The loaded tool definitions returned by tool search.

  * `:type` - **required** - `:tool_search_output`  
    The type of the item. Always `tool_search_output`.  
    Allowed values: `"tool_search_output"`  
    Default: `"tool_search_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          call_id: String.t() | any(),
          created_by: String.t() | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t(),
          id: String.t(),
          status: ExOpenAI.Components.FunctionCallOutputStatusEnum.t(),
          tools: list(ExOpenAI.Components.Tool.t()),
          type: :tool_search_output
        }
  defstruct [:call_id, :created_by, :execution, :id, :status, :tools, :type]
end
