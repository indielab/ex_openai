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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:grader) =>
                (((ExOpenAI.Components.GraderStringCheck.input()
                   | ExOpenAI.Components.GraderTextSimilarity.input())
                  | ExOpenAI.Components.GraderPython.input())
                 | ExOpenAI.Components.GraderScoreModel.input())
                | ExOpenAI.Components.GraderMulti.input(),
              optional(:hyperparameters) =>
                ExOpenAI.Components.FineTuneReinforcementHyperparameters.input()
            }
  defstruct [:grader, :hyperparameters]
end
