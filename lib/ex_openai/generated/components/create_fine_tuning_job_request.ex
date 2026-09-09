defmodule ExOpenAI.Components.CreateFineTuningJobRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateFineTuningJobRequest.

  ## Fields

  * `:hyperparameters` - **optional** - `%{ optional(:batch_size) => :auto | integer(), optional(:learning_rate_multiplier) => :auto | number(), optional(:n_epochs) => :auto | integer() }`
    The hyperparameters used for the fine-tuning job.
  This value is now deprecated in favor of `method`, and should be passed in under the `method` parameter.

  * `:integrations` - **optional** - `list(%{ required(:type) => :wandb, required(:wandb) => %{ optional(:entity) => String.t() | nil, optional(:name) => String.t() | nil, required(:project) => String.t(), optional(:tags) => list(String.t()) } }) | nil`
    A list of integrations to enable for your fine-tuning job.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:method` - **optional** - `ExOpenAI.Components.FineTuneMethod.t()`

  * `:model` - **required** - `String.t() | :"babbage-002" | :"davinci-002" | :"gpt-3.5-turbo" | :"gpt-4o-mini"`
    The name of the model to fine-tune. You can select one of the
  [supported models](https://platform.openai.com/docs/guides/fine-tuning#which-models-can-be-fine-tuned).

  * `:seed` - **optional** - `integer() | nil`
    The seed controls the reproducibility of the job. Passing in the same seed and job parameters should produce the same results, but may differ in rare cases.
  If a seed is not specified, one will be generated for you.
    Constraints: minimum: 0, maximum: 2147483647

  * `:suffix` - **optional** - `String.t() | nil`
    A string of up to 64 characters that will be added to your fine-tuned model name.

  For example, a `suffix` of "custom-model-name" would produce a model name like `ft:gpt-4o-mini:openai:custom-model-name:7p4lURel`.
    Default: `nil`
    Constraints: minLength: 1, maxLength: 64

  * `:training_file` - **required** - `String.t()`
    The ID of an uploaded file that contains training data.

  See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.

  Your dataset must be formatted as a JSONL file. Additionally, you must upload your file with the purpose `fine-tune`.

  The contents of the file should differ depending on if the model uses the [chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input), [completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) format, or if the fine-tuning method uses the [preference](https://platform.openai.com/docs/api-reference/fine-tuning/preference-input) format.

  See the [fine-tuning guide](https://platform.openai.com/docs/guides/model-optimization) for more details.

  * `:validation_file` - **optional** - `String.t() | nil`
    The ID of an uploaded file that contains validation data.

  If you provide this file, the data is used to generate validation
  metrics periodically during fine-tuning. These metrics can be viewed in
  the fine-tuning results file.
  The same data should not be present in both train and validation files.

  Your dataset must be formatted as a JSONL file. You must upload your file with the purpose `fine-tune`.

  See the [fine-tuning guide](https://platform.openai.com/docs/guides/model-optimization) for more details.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          hyperparameters:
            %{
              optional(:batch_size) => :auto | integer(),
              optional(:learning_rate_multiplier) => :auto | number(),
              optional(:n_epochs) => :auto | integer()
            }
            | nil,
          integrations:
            list(%{
              required(:type) => :wandb,
              required(:wandb) => %{
                optional(:entity) => String.t() | nil,
                optional(:name) => String.t() | nil,
                required(:project) => String.t(),
                optional(:tags) => list(String.t())
              }
            })
            | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          method: ExOpenAI.Components.FineTuneMethod.t() | nil,
          model:
            String.t() | ((:"babbage-002" | :"davinci-002") | :"gpt-3.5-turbo") | :"gpt-4o-mini",
          seed: integer() | nil,
          suffix: String.t() | nil,
          training_file: String.t(),
          validation_file: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:hyperparameters) => %{
                optional(:batch_size) => (:auto | String.t()) | integer(),
                optional(:learning_rate_multiplier) => (:auto | String.t()) | number(),
                optional(:n_epochs) => (:auto | String.t()) | integer()
              },
              optional(:integrations) =>
                list(%{
                  required(:type) => :wandb | String.t(),
                  required(:wandb) => %{
                    optional(:entity) => String.t() | nil,
                    optional(:name) => String.t() | nil,
                    required(:project) => String.t(),
                    optional(:tags) => list(String.t())
                  }
                })
                | nil,
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:method) => ExOpenAI.Components.FineTuneMethod.input(),
              required(:model) =>
                String.t()
                | (((:"babbage-002" | :"davinci-002") | :"gpt-3.5-turbo") | :"gpt-4o-mini")
                | String.t(),
              optional(:seed) => integer() | nil,
              optional(:suffix) => String.t() | nil,
              required(:training_file) => String.t(),
              optional(:validation_file) => String.t() | nil
            }
  defstruct [
    :hyperparameters,
    :integrations,
    :metadata,
    :method,
    :model,
    :seed,
    :suffix,
    :training_file,
    :validation_file
  ]
end
