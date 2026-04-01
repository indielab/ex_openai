defmodule ExOpenAI.Components.MessageDeltaContentRefusalObject do
  use ExOpenAI.Jason

  @moduledoc """
  The refusal content that is part of a message.

  ## Fields

  * `:index` - **required** - `integer()`  
    The index of the refusal part in the message.

  * `:refusal` - **optional** - `String.t()`

  * `:type` - **required** - `:refusal`  
    Always `refusal`.  
    Allowed values: `"refusal"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          index: integer(),
          refusal: String.t() | nil,
          type: :refusal
        }
  defstruct [:index, :refusal, :type]
end
