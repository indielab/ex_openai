defmodule ExOpenAI.Components.RealtimeServerEventResponseContentPartDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a content part is done streaming in an assistant message item.
  Also emitted when a Response is interrupted, incomplete, or cancelled.


  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the content part in the item's content array.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response.

  * `:part` - **required** - `%{ optional(:audio) => String.t(), optional(:text) => String.t(), optional(:transcript) => String.t(), optional(:type) => :audio | :text }`
    The content part that is done.

  * `:response_id` - **required** - `String.t()`
    The ID of the response.

  * `:type` - **required** - `:"response.content_part.done"`
    The event type, must be `response.content_part.done`.
    Allowed values: `"response.content_part.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          part: %{
            optional(:audio) => String.t(),
            optional(:text) => String.t(),
            optional(:transcript) => String.t(),
            optional(:type) => :audio | :text
          },
          response_id: String.t(),
          type: :"response.content_part.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:part) => %{
                optional(:audio) => String.t(),
                optional(:text) => String.t(),
                optional(:transcript) => String.t(),
                optional(:type) => (:audio | :text) | String.t()
              },
              required(:response_id) => String.t(),
              required(:type) => :"response.content_part.done" | String.t()
            }
  defstruct [:content_index, :event_id, :item_id, :output_index, :part, :response_id, :type]
end
