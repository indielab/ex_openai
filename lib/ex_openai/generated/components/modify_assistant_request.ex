defmodule ExOpenAI.Components.ModifyAssistantRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyAssistantRequest.

  ## Fields

  * `:description` - **optional** - `String.t() | any()`

  * `:instructions` - **optional** - `String.t() | any()`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t() | ExOpenAI.Components.AssistantSupportedModels.t()`  
    ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.

  * `:name` - **optional** - `String.t() | any()`

  * `:reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t()`

  * `:response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | any()`

  * `:temperature` - **optional** - `number() | any()`

  * `:tool_resources` - **optional** - `{:%{}, [], [{{:optional, [], [:code_interpreter]}, {:%{}, [], [{{:optional, [], [:file_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}, {{:optional, [], [:file_search]}, {:%{}, [], [{{:optional, [], [:vector_store_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}]} | any()`

  * `:tools` - **optional** - `[ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearch.t() | ExOpenAI.Components.AssistantToolsFunction.t()]`  
    A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.  
    Default: `[]`  
    Constraints: maxItems: 128

  * `:top_p` - **optional** - `number() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | any()) | nil,
          instructions: (String.t() | any()) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: (String.t() | ExOpenAI.Components.AssistantSupportedModels.t()) | nil,
          name: (String.t() | any()) | nil,
          reasoning_effort: ExOpenAI.Components.ReasoningEffort.t() | nil,
          response_format:
            (ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | any()) | nil,
          temperature: (number() | any()) | nil,
          tool_resources:
            (%{
               optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
               optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
             }
             | any())
            | nil,
          tools:
            list(
              (ExOpenAI.Components.AssistantToolsCode.t()
               | ExOpenAI.Components.AssistantToolsFileSearch.t())
              | ExOpenAI.Components.AssistantToolsFunction.t()
            )
            | nil,
          top_p: (number() | any()) | nil
        }
  defstruct [
    :description,
    :instructions,
    :metadata,
    :model,
    :name,
    :reasoning_effort,
    :response_format,
    :temperature,
    :tool_resources,
    :tools,
    :top_p
  ]
end
