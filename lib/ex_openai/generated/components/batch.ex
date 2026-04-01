defmodule ExOpenAI.Components.Batch do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Batch.

  ## Fields

  * `:cancelled_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch was cancelled.

  * `:cancelling_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch started cancelling.

  * `:completed_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch was completed.

  * `:completion_window` - **required** - `String.t()`  
    The time frame within which the batch should be processed.

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the batch was created.

  * `:endpoint` - **required** - `String.t()`  
    The OpenAI API endpoint used by the batch.

  * `:error_file_id` - **optional** - `String.t()`  
    The ID of the file containing the outputs of requests with errors.

  * `:errors` - **optional** - `{:%{}, [], [{{:optional, [], [:data]}, {:list, [], [{:%{}, [], [{{:optional, [], [:code]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:line]}, {:|, [], [{:integer, [], []}, {:any, [], []}]}}, {{:optional, [], [:message]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:param]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}]}]}}, {{:optional, [], [:object]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:expired_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch expired.

  * `:expires_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch will expire.

  * `:failed_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch failed.

  * `:finalizing_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch started finalizing.

  * `:id` - **required** - `String.t()`

  * `:in_progress_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) for when the batch started processing.

  * `:input_file_id` - **required** - `String.t()`  
    The ID of the input file for the batch.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t()`  
    Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
  offers a wide range of models with different capabilities, performance
  characteristics, and price points. Refer to the [model
  guide](/docs/models) to browse and compare available models.

  * `:object` - **required** - `:batch`  
    The object type, which is always `batch`.  
    Allowed values: `"batch"`

  * `:output_file_id` - **optional** - `String.t()`  
    The ID of the file containing the outputs of successfully executed requests.

  * `:request_counts` - **optional** - `{:%{}, [], [{{:required, [], [:completed]}, {:integer, [], []}}, {{:required, [], [:failed]}, {:integer, [], []}}, {{:required, [], [:total]}, {:integer, [], []}}]}`  
    The request counts for different statuses within the batch.

  * `:status` - **required** - `:validating | :failed | :in_progress | :finalizing | :completed | :expired | :cancelling | :cancelled`  
    The current status of the batch.  
    Allowed values: `"validating"`, `"failed"`, `"in_progress"`, `"finalizing"`, `"completed"`, `"expired"`, `"cancelling"`, `"cancelled"`

  * `:usage` - **optional** - `{:%{}, [], [{{:required, [], [:input_tokens]}, {:integer, [], []}}, {{:required, [], [:input_tokens_details]}, {:%{}, [], [{{:required, [], [:cached_tokens]}, {:integer, [], []}}]}}, {{:required, [], [:output_tokens]}, {:integer, [], []}}, {{:required, [], [:output_tokens_details]}, {:%{}, [], [{{:required, [], [:reasoning_tokens]}, {:integer, [], []}}]}}, {{:required, [], [:total_tokens]}, {:integer, [], []}}]}`  
    Represents token usage details including input tokens, output tokens, a
  breakdown of output tokens, and the total tokens used. Only populated on
  batches created after September 7, 2025.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          cancelled_at: integer() | nil,
          cancelling_at: integer() | nil,
          completed_at: integer() | nil,
          completion_window: String.t(),
          created_at: integer(),
          endpoint: String.t(),
          error_file_id: String.t() | nil,
          errors:
            %{
              optional(:data) =>
                list(%{
                  optional(:code) => String.t(),
                  optional(:line) => integer() | any(),
                  optional(:message) => String.t(),
                  optional(:param) => String.t() | any()
                }),
              optional(:object) => String.t()
            }
            | nil,
          expired_at: integer() | nil,
          expires_at: integer() | nil,
          failed_at: integer() | nil,
          finalizing_at: integer() | nil,
          id: String.t(),
          in_progress_at: integer() | nil,
          input_file_id: String.t(),
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          model: String.t() | nil,
          object: :batch,
          output_file_id: String.t() | nil,
          request_counts:
            %{
              required(:completed) => integer(),
              required(:failed) => integer(),
              required(:total) => integer()
            }
            | nil,
          status:
            ((((((:validating | :failed) | :in_progress) | :finalizing) | :completed) | :expired)
             | :cancelling)
            | :cancelled,
          usage:
            %{
              required(:input_tokens) => integer(),
              required(:input_tokens_details) => %{required(:cached_tokens) => integer()},
              required(:output_tokens) => integer(),
              required(:output_tokens_details) => %{required(:reasoning_tokens) => integer()},
              required(:total_tokens) => integer()
            }
            | nil
        }
  defstruct [
    :cancelled_at,
    :cancelling_at,
    :completed_at,
    :completion_window,
    :created_at,
    :endpoint,
    :error_file_id,
    :errors,
    :expired_at,
    :expires_at,
    :failed_at,
    :finalizing_at,
    :id,
    :in_progress_at,
    :input_file_id,
    :metadata,
    :model,
    :object,
    :output_file_id,
    :request_counts,
    :status,
    :usage
  ]
end
