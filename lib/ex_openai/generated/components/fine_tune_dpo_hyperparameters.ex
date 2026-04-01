defmodule ExOpenAI.Components.FineTuneDPOHyperparameters do
  use ExOpenAI.Jason

  @moduledoc """
  The hyperparameters used for the DPO fine-tuning job.

  ## Fields

  * `:batch_size` - **optional** - `:auto | integer()`  
    Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.  
    Default: `"auto"`

  * `:beta` - **optional** - `:auto | number()`  
    The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.  
    Default: `"auto"`

  * `:learning_rate_multiplier` - **optional** - `:auto | number()`  
    Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.  
    Default: `"auto"`

  * `:n_epochs` - **optional** - `:auto | integer()`  
    The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.  
    Default: `"auto"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          batch_size: (:auto | integer()) | nil,
          beta: (:auto | number()) | nil,
          learning_rate_multiplier: (:auto | number()) | nil,
          n_epochs: (:auto | integer()) | nil
        }
  defstruct [:batch_size, :beta, :learning_rate_multiplier, :n_epochs]
end
