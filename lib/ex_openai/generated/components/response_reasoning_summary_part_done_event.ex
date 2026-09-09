defmodule ExOpenAI.Components.ResponseReasoningSummaryPartDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a reasoning summary part is completed.

  ## Fields

  * `:item_id` - **required** - `String.t()`
    The ID of the item this summary part is associated with.

  * `:output_index` - **required** - `integer()`
    The index of the output item this summary part is associated with.

  * `:part` - **required** - `%{required(:text) => String.t(), required(:type) => :summary_text}`
    The completed summary part.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:status` - **optional** - `:incomplete`
    The completion status of the summary part. Omitted when the part completed
  normally and set to `incomplete` when generation was interrupted.
    Allowed values: `"incomplete"`

  * `:summary_index` - **required** - `integer()`
    The index of the summary part within the reasoning summary.

  * `:type` - **required** - `:"response.reasoning_summary_part.done"`
    The type of the event. Always `response.reasoning_summary_part.done`.
    Allowed values: `"response.reasoning_summary_part.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          part: %{required(:text) => String.t(), required(:type) => :summary_text},
          sequence_number: integer(),
          status: :incomplete | nil,
          summary_index: integer(),
          type: :"response.reasoning_summary_part.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:part) => %{
                required(:text) => String.t(),
                required(:type) => :summary_text | String.t()
              },
              required(:sequence_number) => integer(),
              optional(:status) => :incomplete | String.t(),
              required(:summary_index) => integer(),
              required(:type) => :"response.reasoning_summary_part.done" | String.t()
            }
  defstruct [:item_id, :output_index, :part, :sequence_number, :status, :summary_index, :type]
end
