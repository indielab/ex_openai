defmodule ExOpenAI.Components.ChatCompletionFunctions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionFunctions.

  ## Fields

  * `:description` - **optional** - `String.t()`
    A description of what the function does, used by the model to choose when and how to call the function.

  * `:name` - **required** - `String.t()`
    The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.

  * `:parameters` - **optional** - `ExOpenAI.Components.FunctionParameters.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t() | nil,
          name: String.t(),
          parameters: ExOpenAI.Components.FunctionParameters.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:description) => String.t(),
              required(:name) => String.t(),
              optional(:parameters) => ExOpenAI.Components.FunctionParameters.input()
            }
  defstruct [:description, :name, :parameters]
end
