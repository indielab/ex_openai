defmodule ExOpenAI.Components.Batch do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Batch.

  ## Fields

  * `:cancelled_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch was cancelled.
    Format: `unixtime`

  * `:cancelling_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch started cancelling.
    Format: `unixtime`

  * `:completed_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch was completed.
    Format: `unixtime`

  * `:completion_window` - **required** - `String.t()`
    The time frame within which the batch should be processed.

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the batch was created.
    Format: `unixtime`

  * `:endpoint` - **required** - `String.t()`
    The OpenAI API endpoint used by the batch.

  * `:error_file_id` - **optional** - `String.t()`
    The ID of the file containing the outputs of requests with errors.

  * `:errors` - **optional** - `%{optional(:data) => list(ExOpenAI.Components.BatchError.t()), optional(:object) => String.t()}`

  * `:expired_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch expired.
    Format: `unixtime`

  * `:expires_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch will expire.
    Format: `unixtime`

  * `:failed_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch failed.
    Format: `unixtime`

  * `:finalizing_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch started finalizing.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`

  * `:in_progress_at` - **optional** - `integer()`
    The Unix timestamp (in seconds) for when the batch started processing.
    Format: `unixtime`

  * `:input_file_id` - **required** - `String.t()`
    The ID of the input file for the batch.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:model` - **optional** - `String.t()`
    Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
  offers a wide range of models with different capabilities, performance
  characteristics, and price points. Refer to the [model
  guide](https://platform.openai.com/docs/models) to browse and compare available models.

  * `:object` - **required** - `:batch`
    The object type, which is always `batch`.
    Allowed values: `"batch"`

  * `:output_file_id` - **optional** - `String.t()`
    The ID of the file containing the outputs of successfully executed requests.

  * `:request_counts` - **optional** - `ExOpenAI.Components.BatchRequestCounts.t()`

  * `:status` - **required** - `:validating | :failed | :in_progress | :finalizing | :completed | :expired | :cancelling | :cancelled`
    The current status of the batch.
    Allowed values: `"validating"`, `"failed"`, `"in_progress"`, `"finalizing"`, `"completed"`, `"expired"`, `"cancelling"`, `"cancelled"`

  * `:usage` - **optional** - `%{ required(:input_tokens) => integer(), required(:input_tokens_details) => %{required(:cached_tokens) => integer()}, required(:output_tokens) => integer(), required(:output_tokens_details) => %{required(:reasoning_tokens) => integer()}, required(:total_tokens) => integer() }`
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
              optional(:data) => list(ExOpenAI.Components.BatchError.t()),
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
          request_counts: ExOpenAI.Components.BatchRequestCounts.t() | nil,
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:cancelled_at) => integer(),
              optional(:cancelling_at) => integer(),
              optional(:completed_at) => integer(),
              required(:completion_window) => String.t(),
              required(:created_at) => integer(),
              required(:endpoint) => String.t(),
              optional(:error_file_id) => String.t(),
              optional(:errors) => %{
                optional(:data) => list(ExOpenAI.Components.BatchError.input()),
                optional(:object) => String.t()
              },
              optional(:expired_at) => integer(),
              optional(:expires_at) => integer(),
              optional(:failed_at) => integer(),
              optional(:finalizing_at) => integer(),
              required(:id) => String.t(),
              optional(:in_progress_at) => integer(),
              required(:input_file_id) => String.t(),
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:model) => String.t(),
              required(:object) => :batch | String.t(),
              optional(:output_file_id) => String.t(),
              optional(:request_counts) => ExOpenAI.Components.BatchRequestCounts.input(),
              required(:status) =>
                (((((((:validating | :failed) | :in_progress) | :finalizing) | :completed)
                   | :expired)
                  | :cancelling)
                 | :cancelled)
                | String.t(),
              optional(:usage) => %{
                required(:input_tokens) => integer(),
                required(:input_tokens_details) => %{required(:cached_tokens) => integer()},
                required(:output_tokens) => integer(),
                required(:output_tokens_details) => %{required(:reasoning_tokens) => integer()},
                required(:total_tokens) => integer()
              }
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
