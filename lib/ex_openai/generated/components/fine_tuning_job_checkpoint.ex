defmodule ExOpenAI.Components.FineTuningJobCheckpoint do
  use ExOpenAI.Jason

  @moduledoc """
  The `fine_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the checkpoint was created.
    Format: `unixtime`

  * `:fine_tuned_model_checkpoint` - **required** - `String.t()`
    The name of the fine-tuned checkpoint model that is created.

  * `:fine_tuning_job_id` - **required** - `String.t()`
    The name of the fine-tuning job that this checkpoint was created from.

  * `:id` - **required** - `String.t()`
    The checkpoint identifier, which can be referenced in the API endpoints.

  * `:metrics` - **required** - `%{ optional(:full_valid_loss) => number(), optional(:full_valid_mean_token_accuracy) => number(), optional(:step) => number(), optional(:train_loss) => number(), optional(:train_mean_token_accuracy) => number(), optional(:valid_loss) => number(), optional(:valid_mean_token_accuracy) => number() }`
    Metrics at the step number during the fine-tuning job.

  * `:object` - **required** - `:"fine_tuning.job.checkpoint"`
    The object type, which is always "fine_tuning.job.checkpoint".
    Allowed values: `"fine_tuning.job.checkpoint"`

  * `:step_number` - **required** - `integer()`
    The step number that the checkpoint was created at.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          fine_tuned_model_checkpoint: String.t(),
          fine_tuning_job_id: String.t(),
          id: String.t(),
          metrics: %{
            optional(:full_valid_loss) => number(),
            optional(:full_valid_mean_token_accuracy) => number(),
            optional(:step) => number(),
            optional(:train_loss) => number(),
            optional(:train_mean_token_accuracy) => number(),
            optional(:valid_loss) => number(),
            optional(:valid_mean_token_accuracy) => number()
          },
          object: :"fine_tuning.job.checkpoint",
          step_number: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:fine_tuned_model_checkpoint) => String.t(),
              required(:fine_tuning_job_id) => String.t(),
              required(:id) => String.t(),
              required(:metrics) => %{
                optional(:full_valid_loss) => number(),
                optional(:full_valid_mean_token_accuracy) => number(),
                optional(:step) => number(),
                optional(:train_loss) => number(),
                optional(:train_mean_token_accuracy) => number(),
                optional(:valid_loss) => number(),
                optional(:valid_mean_token_accuracy) => number()
              },
              required(:object) => :"fine_tuning.job.checkpoint" | String.t(),
              required(:step_number) => integer()
            }
  defstruct [
    :created_at,
    :fine_tuned_model_checkpoint,
    :fine_tuning_job_id,
    :id,
    :metrics,
    :object,
    :step_number
  ]
end
