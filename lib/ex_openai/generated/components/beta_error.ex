defmodule ExOpenAI.Components.BetaError do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaError.

  ## Fields

  * `:code` - **required** - `String.t() | nil`

  * `:message` - **required** - `String.t()`

  * `:param` - **required** - `String.t() | nil`

  * `:type` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: String.t() | nil,
          message: String.t(),
          param: String.t() | nil,
          type: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code) => String.t() | nil,
              required(:message) => String.t(),
              required(:param) => String.t() | nil,
              required(:type) => String.t()
            }
  defstruct [:code, :message, :param, :type]
end
