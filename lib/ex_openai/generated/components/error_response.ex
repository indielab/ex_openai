defmodule ExOpenAI.Components.ErrorResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ErrorResponse.

  ## Fields

  * `:error` - **required** - `ExOpenAI.Components.Error.t()`
  """
  @type t() :: %{__struct__: __MODULE__, error: ExOpenAI.Components.Error.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:error) => ExOpenAI.Components.Error.input()}
  defstruct [:error]
end
