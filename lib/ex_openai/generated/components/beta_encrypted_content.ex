defmodule ExOpenAI.Components.BetaEncryptedContent do
  use ExOpenAI.Jason

  @moduledoc """
  Opaque encrypted content that Responses API decrypts inside trusted model execution.

  ## Fields

  * `:encrypted_content` - **required** - `String.t()`
    Opaque encrypted content.

  * `:type` - **required** - `:encrypted_content`
    The type of the input item. Always `encrypted_content`.
    Allowed values: `"encrypted_content"`
    Default: `"encrypted_content"`
  """
  @type t() :: %{__struct__: __MODULE__, encrypted_content: String.t(), type: :encrypted_content}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:encrypted_content) => String.t(),
              required(:type) => :encrypted_content | String.t()
            }
  defstruct [:encrypted_content, :type]
end
