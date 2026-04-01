defmodule ExOpenAI.Components.FineTuneReinforcementHyperparameters do
  use ExOpenAI.Jason

  @moduledoc """
  The hyperparameters used for the reinforcement fine-tuning job.

  ## Fields

  * `:batch_size` - **optional** - `:auto | integer()`  
    Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.  
    Default: `"auto"`

  * `:compute_multiplier` - **optional** - `:auto | number()`  
    Multiplier on amount of compute used for exploring search space during training.  
    Default: `"auto"`

  * `:eval_interval` - **optional** - `:auto | integer()`  
    The number of training steps between evaluation runs.  
    Default: `"auto"`

  * `:eval_samples` - **optional** - `:auto | integer()`  
    Number of evaluation samples to generate per training step.  
    Default: `"auto"`

  * `:learning_rate_multiplier` - **optional** - `:auto | number()`  
    Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.  
    Default: `"auto"`

  * `:n_epochs` - **optional** - `:auto | integer()`  
    The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.  
    Default: `"auto"`

  * `:reasoning_effort` - **optional** - `:default | :low | :medium | :high`  
    Level of reasoning effort.  
    Allowed values: `"default"`, `"low"`, `"medium"`, `"high"`  
    Default: `"default"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          batch_size: (:auto | integer()) | nil,
          compute_multiplier: (:auto | number()) | nil,
          eval_interval: (:auto | integer()) | nil,
          eval_samples: (:auto | integer()) | nil,
          learning_rate_multiplier: (:auto | number()) | nil,
          n_epochs: (:auto | integer()) | nil,
          reasoning_effort: (((:default | :low) | :medium) | :high) | nil
        }
  defstruct [
    :batch_size,
    :compute_multiplier,
    :eval_interval,
    :eval_samples,
    :learning_rate_multiplier,
    :n_epochs,
    :reasoning_effort
  ]
end
