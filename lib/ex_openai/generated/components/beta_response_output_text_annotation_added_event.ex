defmodule ExOpenAI.Components.BetaResponseOutputTextAnnotationAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an annotation is added to output text content.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:annotation` - **required** - `map()`
    The annotation object being added. (See annotation schema for details.)

  * `:annotation_index` - **required** - `integer()`
    The index of the annotation within the content part.

  * `:content_index` - **required** - `integer()`
    The index of the content part within the output item.

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the item to which the annotation is being added.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response's output array.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.output_text.annotation.added"`
    The type of the event. Always 'response.output_text.annotation.added'.
    Allowed values: `"response.output_text.annotation.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          annotation: map(),
          annotation_index: integer(),
          content_index: integer(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.output_text.annotation.added"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:annotation) => map(),
              required(:annotation_index) => integer(),
              required(:content_index) => integer(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.output_text.annotation.added" | String.t()
            }
  defstruct [
    :agent,
    :annotation,
    :annotation_index,
    :content_index,
    :item_id,
    :output_index,
    :sequence_number,
    :type
  ]
end
