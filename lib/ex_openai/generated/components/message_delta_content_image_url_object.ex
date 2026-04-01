defmodule ExOpenAI.Components.MessageDeltaContentImageUrlObject do
  use ExOpenAI.Jason

  @moduledoc """
  References an image URL in the content of a message.

  ## Fields

  * `:image_url` - **optional** - `{:%{}, [], [{{:optional, [], [:detail]}, {:|, [], [{:|, [], [:auto, :low]}, :high]}}, {{:optional, [], [:url]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:index` - **required** - `integer()`  
    The index of the content part in the message.

  * `:type` - **required** - `:image_url`  
    Always `image_url`.  
    Allowed values: `"image_url"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_url:
            %{optional(:detail) => (:auto | :low) | :high, optional(:url) => String.t()} | nil,
          index: integer(),
          type: :image_url
        }
  defstruct [:image_url, :index, :type]
end
