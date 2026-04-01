defmodule ExOpenAI.Components.FineTuneReinforcementMethod do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for the reinforcement fine-tuning method.

  ## Fields

  * `:grader` - **required** - `map()`  
    The grader used for the fine-tuning job.

  * `:hyperparameters` - **optional** - `ExOpenAI.Components.FineTuneReinforcementHyperparameters.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          grader: map(),
          hyperparameters: ExOpenAI.Components.FineTuneReinforcementHyperparameters.t() | nil
        }
  defstruct [:grader, :hyperparameters]
end
