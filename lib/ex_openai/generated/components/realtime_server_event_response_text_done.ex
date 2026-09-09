defmodule ExOpenAI.Components.RealtimeServerEventResponseTextDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the text value of an "output_text" content part is done streaming. Also
  emitted when a Response is interrupted, incomplete, or cancelled.


  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the content part in the item's content array.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`
    The ID of the response.

  * `:text` - **required** - `String.t()`
    The final text content.

  * `:type` - **required** - `:"response.output_text.done"`
    The event type, must be `response.output_text.done`.
    Allowed values: `"response.output_text.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          text: String.t(),
          type: :"response.output_text.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:response_id) => String.t(),
              required(:text) => String.t(),
              required(:type) => :"response.output_text.done" | String.t()
            }
  defstruct [:content_index, :event_id, :item_id, :output_index, :response_id, :text, :type]
end
