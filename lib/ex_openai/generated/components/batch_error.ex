defmodule ExOpenAI.Components.BatchError do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BatchError.

  ## Fields

  * `:code` - **optional** - `String.t()`
    An error code identifying the error type.

  * `:line` - **optional** - `integer() | nil`

  * `:message` - **optional** - `String.t()`
    A human-readable message providing more details about the error.

  * `:param` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: String.t() | nil,
          line: (integer() | nil) | nil,
          message: String.t() | nil,
          param: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:code) => String.t(),
              optional(:line) => integer() | nil,
              optional(:message) => String.t(),
              optional(:param) => String.t() | nil
            }
  defstruct [:code, :line, :message, :param]
end
