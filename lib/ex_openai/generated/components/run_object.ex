defmodule ExOpenAI.Components.RunObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an execution run on a [thread](/docs/api-reference/threads).

  ## Fields

  * `:assistant_id` - **required** - `String.t()`  
    The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.

  * `:cancelled_at` - **required** - `integer() | nil`  
    The Unix timestamp (in seconds) for when the run was cancelled.

  * `:completed_at` - **required** - `integer() | nil`  
    The Unix timestamp (in seconds) for when the run was completed.

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the run was created.

  * `:expires_at` - **required** - `integer() | nil`  
    The Unix timestamp (in seconds) for when the run will expire.

  * `:failed_at` - **required** - `integer() | nil`  
    The Unix timestamp (in seconds) for when the run failed.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints.

  * `:incomplete_details` - **required** - `{:%{}, [], [{{:optional, [], [:reason]}, {:|, [], [:max_completion_tokens, :max_prompt_tokens]}}]} | nil`  
    Details on why the run is incomplete. Will be `null` if the run is not incomplete.

  * `:instructions` - **required** - `String.t()`  
    The instructions that the [assistant](/docs/api-reference/assistants) used for this run.

  * `:last_error` - **required** - `{:%{}, [], [{{:required, [], [:code]}, {:|, [], [{:|, [], [:server_error, :rate_limit_exceeded]}, :invalid_prompt]}}, {{:required, [], [:message]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | nil`  
    The last error associated with this run. Will be `null` if there are no errors.

  * `:max_completion_tokens` - **required** - `integer() | nil`  
    The maximum number of completion tokens specified to have been used over the course of the run.  
    Constraints: minimum: 256

  * `:max_prompt_tokens` - **required** - `integer() | nil`  
    The maximum number of prompt tokens specified to have been used over the course of the run.  
    Constraints: minimum: 256

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **required** - `String.t()`  
    The model that the [assistant](/docs/api-reference/assistants) used for this run.

  * `:object` - **required** - `:"thread.run"`  
    The object type, which is always `thread.run`.  
    Allowed values: `"thread.run"`

  * `:parallel_tool_calls` - **required** - `ExOpenAI.Components.ParallelToolCalls.t()`

  * `:required_action` - **required** - `{:%{}, [], [{{:required, [], [:submit_tool_outputs]}, {:%{}, [], [{{:required, [], [:tool_calls]}, {:list, [], [{{:., [], [ExOpenAI.Components.RunToolCallObject, :t]}, [], []}]}}]}}, {{:required, [], [:type]}, :submit_tool_outputs}]} | nil`  
    Details on the action required to continue the run. Will be `null` if no action is required.

  * `:response_format` - **required** - `ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil`

  * `:started_at` - **required** - `integer() | nil`  
    The Unix timestamp (in seconds) for when the run was started.

  * `:status` - **required** - `:queued | :in_progress | :requires_action | :cancelling | :cancelled | :failed | :completed | :incomplete | :expired`  
    The status of the run, which can be either `queued`, `in_progress`, `requires_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.  
    Allowed values: `"queued"`, `"in_progress"`, `"requires_action"`, `"cancelling"`, `"cancelled"`, `"failed"`, `"completed"`, `"incomplete"`, `"expired"`

  * `:temperature` - **optional** - `number() | nil`  
    The sampling temperature used for this run. If not set, defaults to 1.

  * `:thread_id` - **required** - `String.t()`  
    The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.

  * `:tool_choice` - **required** - `map()`

  * `:tools` - **required** - `[ExOpenAI.Components.AssistantToolsCode.t() | ExOpenAI.Components.AssistantToolsFileSearch.t() | ExOpenAI.Components.AssistantToolsFunction.t()]`  
    The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.  
    Default: `[]`  
    Constraints: maxItems: 20

  * `:top_p` - **optional** - `number() | nil`  
    The nucleus sampling value used for this run. If not set, defaults to 1.

  * `:truncation_strategy` - **required** - `{:%{}, [], [{{:optional, [], [:last_messages]}, {:|, [], [{:integer, [], []}, {:any, [], []}]}}, {{:required, [], [:type]}, {:|, [], [:auto, :last_messages]}}]}`

  * `:usage` - **required** - `ExOpenAI.Components.RunCompletionUsage.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          assistant_id: String.t(),
          cancelled_at: integer() | nil,
          completed_at: integer() | nil,
          created_at: integer(),
          expires_at: integer() | nil,
          failed_at: integer() | nil,
          id: String.t(),
          incomplete_details:
            %{optional(:reason) => :max_completion_tokens | :max_prompt_tokens} | nil,
          instructions: String.t(),
          last_error:
            %{
              required(:code) => (:server_error | :rate_limit_exceeded) | :invalid_prompt,
              required(:message) => String.t()
            }
            | nil,
          max_completion_tokens: integer() | nil,
          max_prompt_tokens: integer() | nil,
          metadata: ExOpenAI.Components.Metadata.t(),
          model: String.t(),
          object: :"thread.run",
          parallel_tool_calls: ExOpenAI.Components.ParallelToolCalls.t(),
          required_action:
            %{
              required(:submit_tool_outputs) => %{
                required(:tool_calls) => list(ExOpenAI.Components.RunToolCallObject.t())
              },
              required(:type) => :submit_tool_outputs
            }
            | nil,
          response_format: ExOpenAI.Components.AssistantsApiResponseFormatOption.t() | nil,
          started_at: integer() | nil,
          status:
            (((((((:queued | :in_progress) | :requires_action) | :cancelling) | :cancelled)
               | :failed)
              | :completed)
             | :incomplete)
            | :expired,
          temperature: number() | nil,
          thread_id: String.t(),
          tool_choice: map(),
          tools:
            list(
              (ExOpenAI.Components.AssistantToolsCode.t()
               | ExOpenAI.Components.AssistantToolsFileSearch.t())
              | ExOpenAI.Components.AssistantToolsFunction.t()
            ),
          top_p: number() | nil,
          truncation_strategy: %{
            optional(:last_messages) => integer() | any(),
            required(:type) => :auto | :last_messages
          },
          usage: ExOpenAI.Components.RunCompletionUsage.t()
        }
  defstruct [
    :assistant_id,
    :cancelled_at,
    :completed_at,
    :created_at,
    :expires_at,
    :failed_at,
    :id,
    :incomplete_details,
    :instructions,
    :last_error,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :object,
    :parallel_tool_calls,
    :required_action,
    :response_format,
    :started_at,
    :status,
    :temperature,
    :thread_id,
    :tool_choice,
    :tools,
    :top_p,
    :truncation_strategy,
    :usage
  ]
end
