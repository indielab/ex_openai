defmodule ExOpenAI.Components.MessageContentImageFileObject do
  use ExOpenAI.Jason

  @moduledoc """
  References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.

  ## Fields

  * `:image_file` - **required** - `%{optional(:detail) => :auto | :low | :high, required(:file_id) => String.t()}`

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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:image_file) => %{
                optional(:detail) => ((:auto | :low) | :high) | String.t(),
                required(:file_id) => String.t()
              },
              required(:type) => :image_file | String.t()
            }
  defstruct [:image_file, :type]
end
