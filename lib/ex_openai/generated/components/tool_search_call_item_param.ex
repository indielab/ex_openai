defmodule ExOpenAI.Components.ToolSearchCallItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchCallItemParam.

  ## Fields

  * `:arguments` - **required** - `ExOpenAI.Components.EmptyModelParam.t()`  
    The arguments supplied to the tool search call.

  * `:call_id` - **optional** - `String.t() | any()`

  * `:execution` - **optional** - `ExOpenAI.Components.ToolSearchExecutionType.t()`  
    Whether tool search was executed by the server or by the client.

  * `:id` - **optional** - `String.t() | any()`

  * `:status` - **optional** - `ExOpenAI.Components.FunctionCallItemStatus.t() | any()`

  * `:type` - **required** - `:tool_search_call`  
    The item type. Always `tool_search_call`.  
    Allowed values: `"tool_search_call"`  
    Default: `"tool_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: ExOpenAI.Components.EmptyModelParam.t(),
          call_id: (String.t() | any()) | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t() | nil,
          id: (String.t() | any()) | nil,
          status: (ExOpenAI.Components.FunctionCallItemStatus.t() | any()) | nil,
          type: :tool_search_call
        }
  defstruct [:arguments, :call_id, :execution, :id, :status, :type]
end
