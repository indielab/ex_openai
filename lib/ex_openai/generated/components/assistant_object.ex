defmodule ExOpenAI.Components.AssistantObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an `assistant` that can call the model and use tools.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the assistant was created.
    Format: `unixtime`

  * `:description` - **required** - `String.t() | nil`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints.

  * `:instructions` - **required** - `String.t() | nil`

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **required** - `String.t()`
    ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.

  * `:name` - **required** - `String.t() | nil`

  * `:object` - **required** - `:assistant`
    The object type, which is always `assistant`.
    Allowed values: `"assistant"`

  * `:response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil`

  * `:temperature` - **optional** - `number() | nil`

  * `:tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`

  * `:tools` - **required** - `list( ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearch.t() | ExOpenAI.Components.AssistantToolsFunction.t() )`
    A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.
    Default: `[]`
    Constraints: maxItems: 128

  * `:top_p` - **optional** - `number() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          description: String.t() | nil,
          id: String.t(),
          instructions: String.t() | nil,
          metadata: ExOpenAI.Components.Metadata.t(),
          model: String.t(),
          name: String.t() | nil,
          object: :assistant,
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
            ),
          top_p: (number() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:description) => String.t() | nil,
              required(:id) => String.t(),
              required(:instructions) => String.t() | nil,
              required(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:model) => String.t(),
              required(:name) => String.t() | nil,
              required(:object) => :assistant | String.t(),
              optional(:response_format) =>
                ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil,
              optional(:temperature) => number() | nil,
              optional(:tool_resources) =>
                %{
                  optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
                  optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
                }
                | nil,
              required(:tools) =>
                list(
                  (ExOpenAI.Components.AssistantToolsCode.input()
                   | ExOpenAI.Components.AssistantToolsFileSearch.input())
                  | ExOpenAI.Components.AssistantToolsFunction.input()
                ),
              optional(:top_p) => number() | nil
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
