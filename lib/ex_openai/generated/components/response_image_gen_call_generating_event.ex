defmodule ExOpenAI.Components.ResponseImageGenCallGeneratingEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an image generation tool call is actively generating an image (intermediate state).


  ## Fields

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the image generation item being processed.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response's output array.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of the image generation item being processed.

  * `:type` - **required** - `:"response.image_generation_call.generating"`
    The type of the event. Always 'response.image_generation_call.generating'.
    Allowed values: `"response.image_generation_call.generating"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.image_generation_call.generating"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.image_generation_call.generating" | String.t()
            }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
