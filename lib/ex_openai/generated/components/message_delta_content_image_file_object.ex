defmodule ExOpenAI.Components.MessageDeltaContentImageFileObject do
  use ExOpenAI.Jason

  @moduledoc """
  References an image [File](/docs/api-reference/files) in the content of a message.

  ## Fields

  * `:image_file` - **optional** - `{:%{}, [], [{{:optional, [], [:detail]}, {:|, [], [{:|, [], [:auto, :low]}, :high]}}, {{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:index` - **required** - `integer()`  
    The index of the content part in the message.

  * `:type` - **required** - `:image_file`  
    Always `image_file`.  
    Allowed values: `"image_file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_file:
            %{optional(:detail) => (:auto | :low) | :high, optional(:file_id) => String.t()} | nil,
          index: integer(),
          type: :image_file
        }
  defstruct [:image_file, :index, :type]
end
