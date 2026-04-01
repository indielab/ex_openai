defmodule ExOpenAI.Components.MessageContentImageFileObject do
  use ExOpenAI.Jason

  @moduledoc """
  References an image [File](/docs/api-reference/files) in the content of a message.

  ## Fields

  * `:image_file` - **required** - `{:%{}, [], [{{:optional, [], [:detail]}, {:|, [], [{:|, [], [:auto, :low]}, :high]}}, {{:required, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:image_file`  
    Always `image_file`.  
    Allowed values: `"image_file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_file: %{
            optional(:detail) => (:auto | :low) | :high,
            required(:file_id) => String.t()
          },
          type: :image_file
        }
  defstruct [:image_file, :type]
end
