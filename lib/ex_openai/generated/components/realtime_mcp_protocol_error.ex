defmodule ExOpenAI.Components.RealtimeMCPProtocolError do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RealtimeMCPProtocolError.

  ## Fields

  * `:code` - **required** - `integer()`

  * `:message` - **required** - `String.t()`

  * `:type` - **required** - `:protocol_error`
    Allowed values: `"protocol_error"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: integer(),
          message: String.t(),
          type: :protocol_error
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code) => integer(),
              required(:message) => String.t(),
              required(:type) => :protocol_error | String.t()
            }
  defstruct [:code, :message, :type]
end
