defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseTextDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the text value of an "output_text" content part is updated.

  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the content part in the item's content array.

  * `:delta` - **required** - `String.t()`
    The text delta.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`
    The ID of the response.

  * `:type` - **required** - `:"response.output_text.delta"`
    The event type, must be `response.output_text.delta`.
    Allowed values: `"response.output_text.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          delta: String.t(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.output_text.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:delta) => String.t(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:response_id) => String.t(),
              required(:type) => :"response.output_text.delta" | String.t()
            }
  defstruct [:content_index, :delta, :event_id, :item_id, :output_index, :response_id, :type]
end
