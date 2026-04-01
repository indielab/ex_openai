defmodule ExOpenAI.Components.Error do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Error.

  ## Fields

  * `:code` - **required** - `String.t() | any()`

  * `:message` - **required** - `String.t()`

  * `:param` - **required** - `String.t() | any()`

  * `:type` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: String.t() | any(),
          message: String.t(),
          param: String.t() | any(),
          type: String.t()
        }
  defstruct [:code, :message, :param, :type]
end
