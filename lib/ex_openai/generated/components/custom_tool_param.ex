defmodule ExOpenAI.Components.CustomToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  A custom tool that processes input using a specified format. Learn more about   [custom tools](/docs/guides/function-calling#custom-tools)

  ## Fields

  * `:defer_loading` - **optional** - `boolean()`  
    Whether this tool should be deferred and discovered via tool search.

  * `:description` - **optional** - `String.t()`  
    Optional description of the custom tool, used to provide more context.

  * `:format` - **optional** - `ExOpenAI.Components.CustomTextFormatParam.t() | ExOpenAI.Components.CustomGrammarFormatParam.t()`  
    The input format for the custom tool. Default is unconstrained text.

  * `:name` - **required** - `String.t()`  
    The name of the custom tool, used to identify it in tool calls.

  * `:type` - **required** - `:custom`  
    The type of the custom tool. Always `custom`.  
    Allowed values: `"custom"`  
    Default: `"custom"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          defer_loading: boolean() | nil,
          description: String.t() | nil,
          format:
            (ExOpenAI.Components.CustomTextFormatParam.t()
             | ExOpenAI.Components.CustomGrammarFormatParam.t())
            | nil,
          name: String.t(),
          type: :custom
        }
  defstruct [:defer_loading, :description, :format, :name, :type]
end
