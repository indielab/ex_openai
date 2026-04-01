defmodule ExOpenAI.Components.ImageGenToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  An image generation request made by the model.


  ## Fields

  * `:id` - **required** - `String.t()`  
    The unique ID of the image generation call.

  * `:result` - **required** - `String.t() | any()`

  * `:status` - **required** - `:in_progress | :completed | :generating | :failed`  
    The status of the image generation call.  
    Allowed values: `"in_progress"`, `"completed"`, `"generating"`, `"failed"`

  * `:type` - **required** - `:image_generation_call`  
    The type of the image generation call. Always `image_generation_call`.  
    Allowed values: `"image_generation_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          result: String.t() | any(),
          status: ((:in_progress | :completed) | :generating) | :failed,
          type: :image_generation_call
        }
  defstruct [:id, :result, :status, :type]
end
