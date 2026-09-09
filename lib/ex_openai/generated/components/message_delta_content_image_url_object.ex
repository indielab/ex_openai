defmodule ExOpenAI.Components.MessageDeltaContentImageUrlObject do
  use ExOpenAI.Jason

  @moduledoc """
  References an image URL in the content of a message.

  ## Fields

  * `:image_url` - **optional** - `%{optional(:detail) => :auto | :low | :high, optional(:url) => String.t()}`

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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:image_url) => %{
                optional(:detail) => ((:auto | :low) | :high) | String.t(),
                optional(:url) => String.t()
              },
              required(:index) => integer(),
              required(:type) => :image_url | String.t()
            }
  defstruct [:image_url, :index, :type]
end
