defmodule ExOpenAI.Components.RunStepDetailsToolCallsCodeOutputImageObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDetailsToolCallsCodeOutputImageObject.

  ## Fields

  * `:image` - **required** - `{:%{}, [], [{{:required, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:image`  
    Always `image`.  
    Allowed values: `"image"`
  """
  @type t() :: %{__struct__: __MODULE__, image: %{required(:file_id) => String.t()}, type: :image}
  defstruct [:image, :type]
end
