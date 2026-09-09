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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:index) => integer(),
              optional(:refusal) => String.t(),
              required(:type) => :refusal | String.t()
            }
  defstruct [:index, :refusal, :type]
end
