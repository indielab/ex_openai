defmodule ExOpenAI.Components.ErrorEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.

  ## Fields

  * `:data` - **required** - `ExOpenAI.Components.Error.t()`

  * `:event` - **required** - `:error`
    Allowed values: `"error"`
  """
  @type t() :: %{__struct__: __MODULE__, data: ExOpenAI.Components.Error.t(), event: :error}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => ExOpenAI.Components.Error.input(),
              required(:event) => :error | String.t()
            }
  defstruct [:data, :event]
end
