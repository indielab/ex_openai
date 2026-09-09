defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseMCPCallInProgress do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an MCP tool call has started and is in progress.

  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the MCP tool call item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response.

  * `:type` - **required** - `:"response.mcp_call.in_progress"`
    The event type, must be `response.mcp_call.in_progress`.
    Allowed values: `"response.mcp_call.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          type: :"response.mcp_call.in_progress"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:type) => :"response.mcp_call.in_progress" | String.t()
            }
  defstruct [:event_id, :item_id, :output_index, :type]
end
