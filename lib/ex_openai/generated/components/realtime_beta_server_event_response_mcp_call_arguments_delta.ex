defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseMCPCallArgumentsDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when MCP tool call arguments are updated during response generation.

  ## Fields

  * `:delta` - **required** - `String.t()`  
    The JSON-encoded arguments delta.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the MCP tool call item.

  * `:obfuscation` - **optional** - `String.t() | any()`

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`  
    The ID of the response.

  * `:type` - **required** - `:"response.mcp_call_arguments.delta"`  
    The event type, must be `response.mcp_call_arguments.delta`.  
    Allowed values: `"response.mcp_call_arguments.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          event_id: String.t(),
          item_id: String.t(),
          obfuscation: (String.t() | any()) | nil,
          output_index: integer(),
          response_id: String.t(),
          type: :"response.mcp_call_arguments.delta"
        }
  defstruct [:delta, :event_id, :item_id, :obfuscation, :output_index, :response_id, :type]
end
