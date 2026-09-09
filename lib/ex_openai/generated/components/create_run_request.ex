defmodule ExOpenAI.Components.CreateRunRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateRunRequest.

  ## Fields

  * `:additional_instructions` - **optional** - `String.t() | nil`
    Appends additional instructions at the end of the instructions for the run. This is useful for modifying the behavior on a per-run basis without overriding other instructions.

  * `:additional_messages` - **optional** - `list(ExOpenAI.Components.CreateMessageRequest.t()) | nil`
    Adds additional messages to the thread before creating the run.

  * `:assistant_id` - **required** - `String.t()`
    The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.

  * `:instructions` - **optional** - `String.t() | nil`
    Overrides the [instructions](https://platform.openai.com/docs/api-reference/assistants/createAssistant) of the assistant. This is useful for modifying the behavior on a per-run basis.

  * `:max_completion_tokens` - **optional** - `integer() | nil`
    The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
    Constraints: minimum: 256

  * `:max_prompt_tokens` - **optional** - `integer() | nil`
    The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
    Constraints: minimum: 256

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t() | ExOpenAI.Components.AssistantSupportedModels.t() | nil`
    The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.

  * `:parallel_tool_calls` - **optional** - `ExOpenAI.Components.ParallelToolCalls.t()`

  * `:reasoning_effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t()`

  * `:response_format` - **optional** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil`

  * `:stream` - **optional** - `boolean() | nil`
    If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.

  * `:temperature` - **optional** - `number() | nil`
    What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    Default: `1`
    Constraints: minimum: 0, maximum: 2

  * `:tool_choice` - **optional** - `map()`

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
          additional_instructions: String.t() | nil,
          additional_messages: list(ExOpenAI.Components.CreateMessageRequest.t()) | nil,
          assistant_id: String.t(),
          instructions: String.t() | nil,
          max_completion_tokens: integer() | nil,
          max_prompt_tokens: integer() | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: (String.t() | ExOpenAI.Components.AssistantSupportedModels.t()) | nil,
          parallel_tool_calls: ExOpenAI.Components.ParallelToolCalls.t() | nil,
          reasoning_effort: ExOpenAI.Components.ReasoningEffort.t() | nil,
          response_format: ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil,
          stream: boolean() | nil,
          temperature: number() | nil,
          tool_choice: map() | nil,
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
              optional(:additional_instructions) => String.t() | nil,
              optional(:additional_messages) =>
                list(ExOpenAI.Components.CreateMessageRequest.input()) | nil,
              required(:assistant_id) => String.t(),
              optional(:instructions) => String.t() | nil,
              optional(:max_completion_tokens) => integer() | nil,
              optional(:max_prompt_tokens) => integer() | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:model) =>
                (String.t() | ExOpenAI.Components.AssistantSupportedModels.input()) | nil,
              optional(:parallel_tool_calls) => ExOpenAI.Components.ParallelToolCalls.input(),
              optional(:reasoning_effort) => ExOpenAI.Components.ReasoningEffort.input(),
              optional(:response_format) =>
                ExOpenAI.Components.AssistantsApiResponseFormatOption.input() | nil,
              optional(:stream) => boolean() | nil,
              optional(:temperature) => number() | nil,
              optional(:tool_choice) => map(),
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
    :additional_instructions,
    :additional_messages,
    :assistant_id,
    :instructions,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :parallel_tool_calls,
    :reasoning_effort,
    :response_format,
    :stream,
    :temperature,
    :tool_choice,
    :tools,
    :top_p,
    :truncation_strategy
  ]
end
