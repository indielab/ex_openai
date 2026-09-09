defmodule ExOpenAI.Components.BetaInlineSkillSourceParam do
  use ExOpenAI.Jason

  @moduledoc """
  Inline skill payload

  ## Fields

  * `:data` - **required** - `String.t()`
    Base64-encoded skill zip bundle.
    Constraints: minLength: 1, maxLength: 70254592

  * `:media_type` - **required** - `:"application/zip"`
    The media type of the inline skill payload. Must be `application/zip`.
    Allowed values: `"application/zip"`
    Default: `"application/zip"`

  * `:type` - **required** - `:base64`
    The type of the inline skill source. Must be `base64`.
    Allowed values: `"base64"`
    Default: `"base64"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: String.t(),
          media_type: :"application/zip",
          type: :base64
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => String.t(),
              required(:media_type) => :"application/zip" | String.t(),
              required(:type) => :base64 | String.t()
            }
  defstruct [:data, :media_type, :type]
end
