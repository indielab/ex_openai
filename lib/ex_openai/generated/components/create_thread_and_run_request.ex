defmodule ExOpenAI.Components.CreateThreadAndRunRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateThreadAndRunRequest.

  ## Fields

  * `:assistant_id` - **required** - `String.t()`
    The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.

  * `:instructions` - **optional** - `String.t() | nil`
    Override the default system message of the assistant. This is useful for modifying the behavior on a per-run basis.

  * `:max_completion_tokens` - **optional** - `integer() | nil`
    The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
    Constraints: minimum: 256

  * `:max_prompt_tokens` - **optional** - `integer() | nil`
    The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
    Constraints: minimum: 256

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t() | :"gpt-5" | :"gpt-5-mini" | :"gpt-5-nano" | :"gpt-5-2025-08-07" | :"gpt-5-mini-2025-08-07" | :"gpt-5-nano-2025-08-07" | :"gpt-4.1" | :"gpt-4.1-mini" | :"gpt-4.1-nano" | :"gpt-4.1-2025-04-14" | :"gpt-4.1-mini-2025-04-14" | :"gpt-4.1-nano-2025-04-14" | :"gpt-4o" | :"gpt-4o-2024-11-20" | :"gpt-4o-2024-08-06" | :"gpt-4o-2024-05-13" | :"gpt-4o-mini" | :"gpt-4o-mini-2024-07-18" | :"gpt-4.5-preview" | :"gpt-4.5-preview-2025-02-27" | :"gpt-4-turbo" | :"gpt-4-turbo-2024-04-09" | :"gpt-4-0125-preview" | :"gpt-4-turbo-preview" | :"gpt-4-1106-preview" | :"gpt-4-vision-preview" | :"gpt-4" | :"gpt-4-0314" | :"gpt-4-0613" | :"gpt-4-32k" | :"gpt-4-32k-0314" | :"gpt-4-32k-0613" | :"gpt-3.5-turbo" | :"gpt-3.5-turbo-16k" | :"gpt-3.5-turbo-0613" | :"gpt-3.5-turbo-1106" | :"gpt-3.5-turbo-0125" | :"gpt-3.5-turbo-16k-0613" | nil`
    The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.

  * `:parallel_tool_calls` - **optional** - `ExOpenAI.Components.ParallelToolCalls.t()`

  * `:response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil`

  * `:stream` - **optional** - `boolean() | nil`
    If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.

  * `:temperature` - **optional** - `number() | nil`
    What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    Default: `1`
    Constraints: minimum: 0, maximum: 2

  * `:thread` - **optional** - `ExOpenAI.Components.CreateThreadRequest.t()`

  * `:tool_choice` - **optional** - `map()`

  * `:tool_resources` - **optional** - `%{ optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())}, optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())} } | nil`
    A set of resources that are used by the assistant's tools. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.

  * `:tools` - **optional** - `list( ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearch.t() | ExOpenAI.Components.AssistantToolsFunction.t() ) | nil`
    Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
    Constraints: maxItems: 20

  * `:top_p` - **optional** - `number() | nil`
    An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.

  We generally recommend altering this or temperature but not both.
    Default: `1`
    Constraints: minimum: 0, maximum: 1

  * `:truncation_strategy` - **optional** - `%{optional(:last_messages) => integer() | nil, required(:type) => :auto | :last_messages}`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          assistant_id: String.t(),
          instructions: String.t() | nil,
          max_completion_tokens: integer() | nil,
          max_prompt_tokens: integer() | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model:
            (String.t()
             | ((((((((((((((((((((((((((((((((((((:"gpt-5" | :"gpt-5-mini") | :"gpt-5-nano")
                                                 | :"gpt-5-2025-08-07")
                                                | :"gpt-5-mini-2025-08-07")
                                               | :"gpt-5-nano-2025-08-07")
                                              | :"gpt-4.1")
                                             | :"gpt-4.1-mini")
                                            | :"gpt-4.1-nano")
                                           | :"gpt-4.1-2025-04-14")
                                          | :"gpt-4.1-mini-2025-04-14")
                                         | :"gpt-4.1-nano-2025-04-14")
                                        | :"gpt-4o")
                                       | :"gpt-4o-2024-11-20")
                                      | :"gpt-4o-2024-08-06")
                                     | :"gpt-4o-2024-05-13")
                                    | :"gpt-4o-mini")
                                   | :"gpt-4o-mini-2024-07-18")
                                  | :"gpt-4.5-preview")
                                 | :"gpt-4.5-preview-2025-02-27")
                                | :"gpt-4-turbo")
                               | :"gpt-4-turbo-2024-04-09")
                              | :"gpt-4-0125-preview")
                             | :"gpt-4-turbo-preview")
                            | :"gpt-4-1106-preview")
                           | :"gpt-4-vision-preview")
                          | :"gpt-4")
                         | :"gpt-4-0314")
                        | :"gpt-4-0613")
                       | :"gpt-4-32k")
                      | :"gpt-4-32k-0314")
                     | :"gpt-4-32k-0613")
                    | :"gpt-3.5-turbo")
                   | :"gpt-3.5-turbo-16k")
                  | :"gpt-3.5-turbo-0613")
                 | :"gpt-3.5-turbo-1106")
                | :"gpt-3.5-turbo-0125")
             | :"gpt-3.5-turbo-16k-0613")
            | nil,
          parallel_tool_calls: ExOpenAI.Components.ParallelToolCalls.t() | nil,
          response_format: ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil,
          stream: boolean() | nil,
          temperature: number() | nil,
          thread: ExOpenAI.Components.CreateThreadRequest.t() | nil,
          tool_choice: map() | nil,
          tool_resources:
            %{
              optional(:code_interpreter) => %{optional(:file_ids) => list(String.t())},
              optional(:file_search) => %{optional(:vector_store_ids) => list(String.t())}
            }
            | nil,
          tools:
            list(
              (ExOpenAI.Components.AssistantToolsCode.t()
               | ExOpenAI.Components.AssistantToolsFileSearch.t())
              | ExOpenAI.Components.AssistantToolsFunction.t()
            )
            | nil,
          top_p: number() | nil,
          truncation_strategy:
            %{
              optional(:last_messages) => integer() | nil,
              required(:type) => :auto | :last_messages
            }
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:assistant_id) => String.t(),
              optional(:instructions) => String.t() | nil,
              optional(:max_completion_tokens) => integer() | nil,
              optional(:max_prompt_tokens) => integer() | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:model) =>
                (String.t()
                 | (((((((((((((((((((((((((((((((((((((:"gpt-5" | :"gpt-5-mini") | :"gpt-5-nano")
                                                      | :"gpt-5-2025-08-07")
                                                     | :"gpt-5-mini-2025-08-07")
                                                    | :"gpt-5-nano-2025-08-07")
                                                   | :"gpt-4.1")
                                                  | :"gpt-4.1-mini")
                                                 | :"gpt-4.1-nano")
                                                | :"gpt-4.1-2025-04-14")
                                               | :"gpt-4.1-mini-2025-04-14")
                                              | :"gpt-4.1-nano-2025-04-14")
                                             | :"gpt-4o")
                                            | :"gpt-4o-2024-11-20")
                                           | :"gpt-4o-2024-08-06")
                                          | :"gpt-4o-2024-05-13")
                                         | :"gpt-4o-mini")
                                        | :"gpt-4o-mini-2024-07-18")
                                       | :"gpt-4.5-preview")
                                      | :"gpt-4.5-preview-2025-02-27")
                                     | :"gpt-4-turbo")
                                    | :"gpt-4-turbo-2024-04-09")
                                   | :"gpt-4-0125-preview")
                                  | :"gpt-4-turbo-preview")
                                 | :"gpt-4-1106-preview")
                                | :"gpt-4-vision-preview")
                               | :"gpt-4")
                              | :"gpt-4-0314")
                             | :"gpt-4-0613")
                            | :"gpt-4-32k")
                           | :"gpt-4-32k-0314")
                          | :"gpt-4-32k-0613")
                         | :"gpt-3.5-turbo")
                        | :"gpt-3.5-turbo-16k")
                       | :"gpt-3.5-turbo-0613")
                      | :"gpt-3.5-turbo-1106")
                     | :"gpt-3.5-turbo-0125")
                    | :"gpt-3.5-turbo-16k-0613")
                 | String.t())
                | nil,
              optional(:parallel_tool_calls) => ExOpenAI.Components.ParallelToolCalls.input(),
              optional(:response_format) =>
                ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil,
              optional(:stream) => boolean() | nil,
              optional(:temperature) => number() | nil,
              optional(:thread) => ExOpenAI.Components.CreateThreadRequest.input(),
              optional(:tool_choice) => map(),
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
                )
                | nil,
              optional(:top_p) => number() | nil,
              optional(:truncation_strategy) => %{
                optional(:last_messages) => integer() | nil,
                required(:type) => (:auto | :last_messages) | String.t()
              }
            }
  defstruct [
    :assistant_id,
    :instructions,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :parallel_tool_calls,
    :response_format,
    :stream,
    :temperature,
    :thread,
    :tool_choice,
    :tool_resources,
    :tools,
    :top_p,
    :truncation_strategy
  ]
end
