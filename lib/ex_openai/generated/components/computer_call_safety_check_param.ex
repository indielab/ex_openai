defmodule ExOpenAI.Components.ComputerCallSafetyCheckParam do
  use ExOpenAI.Jason

  @moduledoc """
  A pending safety check for the computer call.

  ## Fields

  * `:code` - **optional** - `String.t() | nil`

  * `:id` - **required** - `String.t()`
    The ID of the pending safety check.

  * `:message` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: (String.t() | nil) | nil,
          id: String.t(),
          message: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:code) => String.t() | nil,
              required(:id) => String.t(),
              optional(:message) => String.t() | nil
            }
  defstruct [:code, :id, :message]
end
