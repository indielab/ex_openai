defmodule ExOpenAI.Components.MessageContentImageUrlObject do
  use ExOpenAI.Jason

  @moduledoc """
  References an image URL in the content of a message.

  ## Fields

  * `:image_url` - **required** - `%{optional(:detail) => :auto | :low | :high, required(:url) => String.t()}`

  * `:type` - **required** - `:image_url`
    The type of the content part.
    Allowed values: `"image_url"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_url: %{optional(:detail) => (:auto | :low) | :high, required(:url) => String.t()},
          type: :image_url
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:image_url) => %{
                optional(:detail) => ((:auto | :low) | :high) | String.t(),
                required(:url) => String.t()
              },
              required(:type) => :image_url | String.t()
            }
  defstruct [:image_url, :type]
end
