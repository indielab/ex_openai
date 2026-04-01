defmodule ExOpenAI.Components.ResponseErrorEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an error occurs.

  ## Fields

  * `:code` - **required** - `String.t() | any()`

  * `:message` - **required** - `String.t()`  
    The error message.

  * `:param` - **required** - `String.t() | any()`

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:error`  
    The type of the event. Always `error`.  
    Allowed values: `"error"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: String.t() | any(),
          message: String.t(),
          param: String.t() | any(),
          sequence_number: integer(),
          type: :error
        }
  defstruct [:code, :message, :param, :sequence_number, :type]
end
