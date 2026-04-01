defmodule ExOpenAI.Components.AssistantObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an `assistant` that can call the model and use tools.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the assistant was created.

  * `:description` - **required** - `String.t() | any()`

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints.

  * `:instructions` - **required** - `String.t() | any()`

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **required** - `String.t()`  
    ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.

  * `:name` - **required** - `String.t() | any()`

  * `:object` - **required** - `:assistant`  
    The object type, which is always `assistant`.  
    Allowed values: `"assistant"`

  * `:response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | any()`

  * `:temperature` - **optional** - `number() | any()`

  * `:tool_resources` - **optional** - `{:%{}, [], [{{:optional, [], [:code_interpreter]}, {:%{}, [], [{{:optional, [], [:file_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}, {{:optional, [], [:file_search]}, {:%{}, [], [{{:optional, [], [:vector_store_ids]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}]}}]} | any()`

  * `:tools` - **required** - `[ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearch.t() | ExOpenAI.Components.AssistantToolsFunction.t()]`  
    A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.  
    Default: `[]`  
    Constraints: maxItems: 128

  * `:top_p` - **optional** - `number() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          description: String.t() | any(),
          id: String.t(),
          instructions: String.t() | any(),
          metadata: ExOpenAI.Components.Metadata.t(),
          model: String.t(),
          name: String.t() | any(),
          object: :assistant,
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
            ),
          top_p: (number() | any()) | nil
        }
  defstruct [
    :created_at,
    :description,
    :id,
    :instructions,
    :metadata,
    :model,
    :name,
    :object,
    :response_format,
    :temperature,
    :tool_resources,
    :tools,
    :top_p
  ]
end
