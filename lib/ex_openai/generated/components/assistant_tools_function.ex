defmodule ExOpenAI.Components.AssistantToolsFunction do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AssistantToolsFunction.

  ## Fields

  * `:function` - **required** - `ExOpenAI.Components.FunctionObject.t()`

  * `:type` - **required** - `:function`
    The type of tool being defined: `function`
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: ExOpenAI.Components.FunctionObject.t(),
          type: :function
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:function) => ExOpenAI.Components.FunctionObject.input(),
              required(:type) => :function | String.t()
            }
  defstruct [:function, :type]
end
