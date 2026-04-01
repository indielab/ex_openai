defmodule ExOpenAI.Components.ErrorResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ErrorResponse.

  ## Fields

  * `:error` - **required** - `ExOpenAI.Components.Error.t()`
  """
  @type t() :: %{__struct__: __MODULE__, error: ExOpenAI.Components.Error.t()}
  defstruct [:error]
end
