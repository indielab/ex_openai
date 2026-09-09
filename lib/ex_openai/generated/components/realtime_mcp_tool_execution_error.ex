defmodule ExOpenAI.Components.RealtimeMCPToolExecutionError do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RealtimeMCPToolExecutionError.

  ## Fields

  * `:message` - **required** - `String.t()`

  * `:type` - **required** - `:tool_execution_error`
    Allowed values: `"tool_execution_error"`
  """
  @type t() :: %{__struct__: __MODULE__, message: String.t(), type: :tool_execution_error}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:message) => String.t(),
              required(:type) => :tool_execution_error | String.t()
            }
  defstruct [:message, :type]
end
