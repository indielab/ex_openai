defmodule ExOpenAI.Components.ToolSearchCall do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchCall.

  ## Fields

  * `:arguments` - **required** - `any()`  
    Arguments used for the tool search call.

  * `:call_id` - **required** - `String.t() | any()`

  * `:created_by` - **optional** - `String.t()`  
    The identifier of the actor that created the item.

  * `:execution` - **required** - `ExOpenAI.Components.ToolSearchExecutionType.t()`  
    Whether tool search was executed by the server or by the client.

  * `:id` - **required** - `String.t()`  
    The unique ID of the tool search call item.

  * `:status` - **required** - `ExOpenAI.Components.FunctionCallStatus.t()`  
    The status of the tool search call item that was recorded.

  * `:type` - **required** - `:tool_search_call`  
    The type of the item. Always `tool_search_call`.  
    Allowed values: `"tool_search_call"`  
    Default: `"tool_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: any(),
          call_id: String.t() | any(),
          created_by: String.t() | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t(),
          id: String.t(),
          status: ExOpenAI.Components.FunctionCallStatus.t(),
          type: :tool_search_call
        }
  defstruct [:arguments, :call_id, :created_by, :execution, :id, :status, :type]
end
