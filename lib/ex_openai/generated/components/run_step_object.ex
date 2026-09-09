defmodule ExOpenAI.Components.RunStepObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a step in execution of a run.


  ## Fields

  * `:assistant_id` - **required** - `String.t()`
    The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.

  * `:cancelled_at` - **required** - `integer() | nil`

  * `:completed_at` - **required** - `integer() | nil`

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the run step was created.
    Format: `unixtime`

  * `:expired_at` - **required** - `integer() | nil`

  * `:failed_at` - **required** - `integer() | nil`

  * `:id` - **required** - `String.t()`
    The identifier of the run step, which can be referenced in API endpoints.

  * `:last_error` - **required** - `%{required(:code) => :server_error | :rate_limit_exceeded, required(:message) => String.t()} | nil`

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:object` - **required** - `:"thread.run.step"`
    The object type, which is always `thread.run.step`.
    Allowed values: `"thread.run.step"`

  * `:run_id` - **required** - `String.t()`
    The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.

  * `:status` - **required** - `:in_progress | :cancelled | :failed | :completed | :expired`
    The status of the run step, which can be either `in_progress`, `cancelled`, `failed`, `completed`, or `expired`.
    Allowed values: `"in_progress"`, `"cancelled"`, `"failed"`, `"completed"`, `"expired"`

  * `:step_details` - **required** - `map()`
    The details of the run step.

  * `:thread_id` - **required** - `String.t()`
    The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.

  * `:type` - **required** - `:message_creation | :tool_calls`
    The type of run step, which can be either `message_creation` or `tool_calls`.
    Allowed values: `"message_creation"`, `"tool_calls"`

  * `:usage` - **required** - `ExOpenAI.Components.RunStepCompletionUsage.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          assistant_id: String.t(),
          cancelled_at: integer() | nil,
          completed_at: integer() | nil,
          created_at: integer(),
          expired_at: integer() | nil,
          failed_at: integer() | nil,
          id: String.t(),
          last_error:
            %{
              required(:code) => :server_error | :rate_limit_exceeded,
              required(:message) => String.t()
            }
            | nil,
          metadata: ExOpenAI.Components.Metadata.t(),
          object: :"thread.run.step",
          run_id: String.t(),
          status: (((:in_progress | :cancelled) | :failed) | :completed) | :expired,
          step_details: map(),
          thread_id: String.t(),
          type: :message_creation | :tool_calls,
          usage: ExOpenAI.Components.RunStepCompletionUsage.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:assistant_id) => String.t(),
              required(:cancelled_at) => integer() | nil,
              required(:completed_at) => integer() | nil,
              required(:created_at) => integer(),
              required(:expired_at) => integer() | nil,
              required(:failed_at) => integer() | nil,
              required(:id) => String.t(),
              required(:last_error) =>
                %{
                  required(:code) => (:server_error | :rate_limit_exceeded) | String.t(),
                  required(:message) => String.t()
                }
                | nil,
              required(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:object) => :"thread.run.step" | String.t(),
              required(:run_id) => String.t(),
              required(:status) =>
                ((((:in_progress | :cancelled) | :failed) | :completed) | :expired) | String.t(),
              required(:step_details) =>
                ExOpenAI.Components.RunStepDetailsMessageCreationObject.input()
                | ExOpenAI.Components.RunStepDetailsToolCallsObject.input(),
              required(:thread_id) => String.t(),
              required(:type) => (:message_creation | :tool_calls) | String.t(),
              required(:usage) => ExOpenAI.Components.RunStepCompletionUsage.input()
            }
  defstruct [
    :assistant_id,
    :cancelled_at,
    :completed_at,
    :created_at,
    :expired_at,
    :failed_at,
    :id,
    :last_error,
    :metadata,
    :object,
    :run_id,
    :status,
    :step_details,
    :thread_id,
    :type,
    :usage
  ]
end
