defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [image inputs](/docs/guides/vision).


  ## Fields

  * `:image_url` - **required** - `{:%{}, [], [{{:optional, [], [:detail]}, {:|, [], [{:|, [], [:auto, :low]}, :high]}}, {{:required, [], [:url]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:image_url`  
    The type of the content part.  
    Allowed values: `"image_url"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_url: %{optional(:detail) => (:auto | :low) | :high, required(:url) => String.t()},
          type: :image_url
        }
  defstruct [:image_url, :type]
end
