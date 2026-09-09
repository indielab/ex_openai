defmodule ExOpenAI.Components.ChatCompletionModerationError do
  use ExOpenAI.Jason

  @moduledoc """
  An error produced while attempting moderation.

  ## Fields

  * `:code` - **required** - `String.t()`
    The error code.

  * `:message` - **required** - `String.t()`
    The error message.

  * `:type` - **required** - `:error`
    The object type, which is always `error`.
    Allowed values: `"error"`
  """
  @type t() :: %{__struct__: __MODULE__, code: String.t(), message: String.t(), type: :error}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code) => String.t(),
              required(:message) => String.t(),
              required(:type) => :error | String.t()
            }
  defstruct [:code, :message, :type]
end
