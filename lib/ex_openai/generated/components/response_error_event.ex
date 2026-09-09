defmodule ExOpenAI.Components.ResponseErrorEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an error occurs.

  ## Fields

  * `:code` - **required** - `String.t() | nil`

  * `:message` - **required** - `String.t()`
    The error message.

  * `:param` - **required** - `String.t() | nil`

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:error`
    The type of the event. Always `error`.
    Allowed values: `"error"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: String.t() | nil,
          message: String.t(),
          param: String.t() | nil,
          sequence_number: integer(),
          type: :error
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code) => String.t() | nil,
              required(:message) => String.t(),
              required(:param) => String.t() | nil,
              required(:sequence_number) => integer(),
              required(:type) => :error | String.t()
            }
  defstruct [:code, :message, :param, :sequence_number, :type]
end
