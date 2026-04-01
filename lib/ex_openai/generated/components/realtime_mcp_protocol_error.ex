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
  defstruct [:code, :message, :type]
end
