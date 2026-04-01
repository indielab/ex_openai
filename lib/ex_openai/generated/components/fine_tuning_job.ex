defmodule ExOpenAI.Components.FineTuningJob do
  use ExOpenAI.Jason

  @moduledoc """
  The `fine_tuning.job` object represents a fine-tuning job that has been created through the API.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the fine-tuning job was created.

  * `:error` - **required** - `{:%{}, [], [{{:required, [], [:code]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:message]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:param]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}]} | any()`

  * `:estimated_finish` - **optional** - `integer() | any()`

  * `:fine_tuned_model` - **required** - `String.t() | any()`

  * `:finished_at` - **required** - `integer() | any()`

  * `:hyperparameters` - **required** - `{:%{}, [], [{{:optional, [], [:batch_size]}, {:|, [], [{:|, [], [:auto, {:integer, [], []}]}, {:any, [], []}]}}, {{:optional, [], [:learning_rate_multiplier]}, {:|, [], [:auto, {:number, [], []}]}}, {{:optional, [], [:n_epochs]}, {:|, [], [:auto, {:integer, [], []}]}}]}`  
    The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.

  * `:id` - **required** - `String.t()`  
    The object identifier, which can be referenced in the API endpoints.

  * `:integrations` - **optional** - `[ExOpenAI.Components.FineTuningIntegration.t()] | any()`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:method` - **optional** - `ExOpenAI.Components.FineTuneMethod.t()`

  * `:model` - **required** - `String.t()`  
    The base model that is being fine-tuned.

  * `:object` - **required** - `:"fine_tuning.job"`  
    The object type, which is always "fine_tuning.job".  
    Allowed values: `"fine_tuning.job"`

  * `:organization_id` - **required** - `String.t()`  
    The organization that owns the fine-tuning job.

  * `:result_files` - **required** - `[String.t()]`  
    The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](/docs/api-reference/files/retrieve-contents).

  * `:seed` - **required** - `integer()`  
    The seed used for the fine-tuning job.

  * `:status` - **required** - `:validating_files | :queued | :running | :succeeded | :failed | :cancelled`  
    The current status of the fine-tuning job, which can be either `validating_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.  
    Allowed values: `"validating_files"`, `"queued"`, `"running"`, `"succeeded"`, `"failed"`, `"cancelled"`

  * `:trained_tokens` - **required** - `integer() | any()`

  * `:training_file` - **required** - `String.t()`  
    The file ID used for training. You can retrieve the training data with the [Files API](/docs/api-reference/files/retrieve-contents).

  * `:validation_file` - **required** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          error:
            %{
              required(:code) => String.t(),
              required(:message) => String.t(),
              required(:param) => String.t() | any()
            }
            | any(),
          estimated_finish: (integer() | any()) | nil,
          fine_tuned_model: String.t() | any(),
          finished_at: integer() | any(),
          hyperparameters: %{
            optional(:batch_size) => (:auto | integer()) | any(),
            optional(:learning_rate_multiplier) => :auto | number(),
            optional(:n_epochs) => :auto | integer()
          },
          id: String.t(),
          integrations: (list(ExOpenAI.Components.FineTuningIntegration.t()) | any()) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          method: ExOpenAI.Components.FineTuneMethod.t() | nil,
          model: String.t(),
          object: :"fine_tuning.job",
          organization_id: String.t(),
          result_files: list(String.t()),
          seed: integer(),
          status:
            ((((:validating_files | :queued) | :running) | :succeeded) | :failed) | :cancelled,
          trained_tokens: integer() | any(),
          training_file: String.t(),
          validation_file: String.t() | any()
        }
  defstruct [
    :created_at,
    :error,
    :estimated_finish,
    :fine_tuned_model,
    :finished_at,
    :hyperparameters,
    :id,
    :integrations,
    :metadata,
    :method,
    :model,
    :object,
    :organization_id,
    :result_files,
    :seed,
    :status,
    :trained_tokens,
    :training_file,
    :validation_file
  ]
end
