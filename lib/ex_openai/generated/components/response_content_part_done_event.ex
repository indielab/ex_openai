defmodule ExOpenAI.Components.ResponseContentPartDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a content part is done.

  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the content part that is done.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the content part was added to.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the content part was added to.

  * `:part` - **required** - `ExOpenAI.Components.OutputContent.t()`
    The content part that is done.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.content_part.done"`
    The type of the event. Always `response.content_part.done`.
    Allowed values: `"response.content_part.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          item_id: String.t(),
          output_index: integer(),
          part: ExOpenAI.Components.OutputContent.t(),
          sequence_number: integer(),
          type: :"response.content_part.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:part) => ExOpenAI.Components.OutputContent.input(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.content_part.done" | String.t()
            }
  defstruct [:content_index, :item_id, :output_index, :part, :sequence_number, :type]
end
