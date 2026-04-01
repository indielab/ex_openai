defmodule ExOpenAI.Components.RealtimeServerEventResponseMCPCallArgumentsDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when MCP tool call arguments are finalized during response generation.

  ## Fields

  * `:arguments` - **required** - `String.t()`  
    The final JSON-encoded arguments string.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the MCP tool call item.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`  
    The ID of the response.

  * `:type` - **required** - `:"response.mcp_call_arguments.done"`  
    The event type, must be `response.mcp_call_arguments.done`.  
    Allowed values: `"response.mcp_call_arguments.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: String.t(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.mcp_call_arguments.done"
        }
  defstruct [:arguments, :event_id, :item_id, :output_index, :response_id, :type]
end
