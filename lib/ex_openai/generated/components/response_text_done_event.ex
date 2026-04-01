defmodule ExOpenAI.Components.ResponseTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when text content is finalized.

  ## Fields

  * `:content_index` - **required** - `integer()`  
    The index of the content part that the text content is finalized.

  * `:item_id` - **required** - `String.t()`  
    The ID of the output item that the text content is finalized.

  * `:logprobs` - **required** - `[ExOpenAI.Components.ResponseLogProb.t()]`  
    The log probabilities of the tokens in the delta.

  * `:output_index` - **required** - `integer()`  
    The index of the output item that the text content is finalized.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number for this event.

  * `:text` - **required** - `String.t()`  
    The text content that is finalized.

  * `:type` - **required** - `:"response.output_text.done"`  
    The type of the event. Always `response.output_text.done`.  
    Allowed values: `"response.output_text.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          item_id: String.t(),
          logprobs: list(ExOpenAI.Components.ResponseLogProb.t()),
          output_index: integer(),
          sequence_number: integer(),
          text: String.t(),
          type: :"response.output_text.done"
        }
  defstruct [:content_index, :item_id, :logprobs, :output_index, :sequence_number, :text, :type]
end
