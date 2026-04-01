defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsCodeOutputImageObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDeltaStepDetailsToolCallsCodeOutputImageObject.

  ## Fields

  * `:image` - **optional** - `{:%{}, [], [{{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:index` - **required** - `integer()`  
    The index of the output in the outputs array.

  * `:type` - **required** - `:image`  
    Always `image`.  
    Allowed values: `"image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image: %{optional(:file_id) => String.t()} | nil,
          index: integer(),
          type: :image
        }
  defstruct [:image, :index, :type]
end
