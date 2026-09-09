defmodule ExOpenAI.Components.ModifyAssistantRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyAssistantRequest.

  ## Fields

  * `:description` - **optional** - `String.t() | nil`

  * `:instructions` - **optional** - `String.t() | nil`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t() | ExOpenAI.Components.AssistantSupportedModels.t()`
    ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.

  * `:name` - **optional** - `String.t() | nil`

  * `:reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t()`

  * `:response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil`

  * `:temperature` - **optional** - `number() | nil`

  * `:tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`

  * `:tools` - **optional** - `list( ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearch.t() | ExOpenAI.Components.AssistantToolsFunction.t() )`
    A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.
    Default: `[]`
    Constraints: maxItems: 128

  * `:top_p` - **optional** - `number() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | nil) | nil,
          instructions: (String.t() | nil) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: (String.t() | ExOpenAI.Components.AssistantSupportedModels.t()) | nil,
          name: (String.t() | nil) | nil,
          reasoning_effort: ExOpenAI.Components.ReasoningEffort.t() | nil,
          response_format:
            (ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil) | nil,
          temperature: (number() | nil) | nil,
          tool_resources:
            (%{
               optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
               optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
             }
             | nil)
            | nil,
          tools:
            list(
              (ExOpenAI.Components.AssistantToolsCode.t()
               | ExOpenAI.Components.AssistantToolsFileSearch.t())
              | ExOpenAI.Components.AssistantToolsFunction.t()
            )
            | nil,
          top_p: (number() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:description) => String.t() | nil,
              optional(:instructions) => String.t() | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:model) =>
                String.t() | ExOpenAI.Components.AssistantSupportedModels.input(),
              optional(:name) => String.t() | nil,
              optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.input(),
              optional(:response_format) =>
                ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil,
              optional(:temperature) => number() | nil,
              optional(:tool_resources) =>
                %{
                  optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                  optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
                }
                | nil,
              optional(:tools) =>
                list(
                  (ExOpenAI.Components.AssistantToolsCode.input()
                   | ExOpenAI.Components.AssistantToolsFileSearch.input())
                  | ExOpenAI.Components.AssistantToolsFunction.input()
                ),
              optional(:top_p) => number() | nil
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
