defmodule ExOpenAI.Components.ResponseOutputItemDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an output item is marked done.

  ## Fields

  * `:item` - **required** - `ExOpenAI.Components.OutputItem.t()`
    The output item that was marked done.

  * `:output_index` - **required** - `integer()`
    The index of the output item that was marked done.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.output_item.done"`
    The type of the event. Always `response.output_item.done`.
    Allowed values: `"response.output_item.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item: ExOpenAI.Components.OutputItem.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.output_item.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item) => ExOpenAI.Components.OutputItem.input(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.output_item.done" | String.t()
            }
  defstruct [:item, :output_index, :sequence_number, :type]
end
