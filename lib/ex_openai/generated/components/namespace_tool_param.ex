defmodule ExOpenAI.Components.NamespaceToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Groups function/custom tools under a shared namespace.

  ## Fields

  * `:description` - **required** - `String.t()`  
    A description of the namespace shown to the model.  
    Constraints: minLength: 1

  * `:name` - **required** - `String.t()`  
    The namespace name used in tool calls (for example, `crm`).  
    Constraints: minLength: 1

  * `:tools` - **required** - `[ExOpenAI.Components.FunctionToolParam.t() | ExOpenAI.Components.CustomToolParam.t()]`  
    The function/custom tools available inside this namespace.  
    Constraints: minItems: 1

  * `:type` - **required** - `:namespace`  
    The type of the tool. Always `namespace`.  
    Allowed values: `"namespace"`  
    Default: `"namespace"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t(),
          name: String.t(),
          tools:
            list(
              ExOpenAI.Components.FunctionToolParam.t()
              | ExOpenAI.Components.CustomToolParam.t()
            ),
          type: :namespace
        }
  defstruct [:description, :name, :tools, :type]
end
