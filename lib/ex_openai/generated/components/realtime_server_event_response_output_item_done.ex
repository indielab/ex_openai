defmodule ExOpenAI.Components.RealtimeServerEventResponseOutputItemDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an Item is done streaming. Also emitted when a Response is
  interrupted, incomplete, or cancelled.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item` - **required** - `ExOpenAI.Components.RealtimeConversationItem.t()`

  * `:output_index` - **required** - `integer()`
    The index of the output item in the Response.

  * `:response_id` - **required** - `String.t()`
    The ID of the Response to which the item belongs.

  * `:type` - **required** - `:"response.output_item.done"`
    The event type, must be `response.output_item.done`.
    Allowed values: `"response.output_item.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item: ExOpenAI.Components.RealtimeConversationItem.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.output_item.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:item) => ExOpenAI.Components.RealtimeConversationItem.input(),
              required(:output_index) => integer(),
              required(:response_id) => String.t(),
              required(:type) => :"response.output_item.done" | String.t()
            }
  defstruct [:event_id, :item, :output_index, :response_id, :type]
end
