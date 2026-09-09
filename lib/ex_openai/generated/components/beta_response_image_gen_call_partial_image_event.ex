defmodule ExOpenAI.Components.BetaResponseImageGenCallPartialImageEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a partial image is available during image generation streaming.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the image generation item being processed.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response's output array.

  * `:partial_image_b64` - **required** - `String.t()`
    Base64-encoded partial image data, suitable for rendering as an image.

  * `:partial_image_index` - **required** - `integer()`
    0-based index for the partial image (backend is 1-based, but this is 0-based for the user).

  * `:sequence_number` - **required** - `integer()`
    The sequence number of the image generation item being processed.

  * `:type` - **required** - `:"response.image_generation_call.partial_image"`
    The type of the event. Always 'response.image_generation_call.partial_image'.
    Allowed values: `"response.image_generation_call.partial_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item_id: String.t(),
          output_index: integer(),
          partial_image_b64: String.t(),
          partial_image_index: integer(),
          sequence_number: integer(),
          type: :"response.image_generation_call.partial_image"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:partial_image_b64) => String.t(),
              required(:partial_image_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.image_generation_call.partial_image" | String.t()
            }
  defstruct [
    :agent,
    :item_id,
    :output_index,
    :partial_image_b64,
    :partial_image_index,
    :sequence_number,
    :type
  ]
end
