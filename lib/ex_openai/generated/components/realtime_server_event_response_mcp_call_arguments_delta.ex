defmodule ExOpenAI.Components.RealtimeServerEventResponseMCPCallArgumentsDelta do
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

  * `:obfuscation` - **optional** - `String.t() | nil`

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
          obfuscation: (String.t() | nil) | nil,
          output_index: integer(),
          response_id: String.t(),
          type: :"response.mcp_call_arguments.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:delta) => String.t(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              optional(:obfuscation) => String.t() | nil,
              required(:output_index) => integer(),
              required(:response_id) => String.t(),
              required(:type) => :"response.mcp_call_arguments.delta" | String.t()
            }
  defstruct [:delta, :event_id, :item_id, :obfuscation, :output_index, :response_id, :type]
end
