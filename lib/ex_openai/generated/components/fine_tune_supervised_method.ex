defmodule ExOpenAI.Components.FineTuneSupervisedMethod do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for the supervised fine-tuning method.

  ## Fields

  * `:hyperparameters` - **optional** - `ExOpenAI.Components.FineTuneSupervisedHyperparameters.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          hyperparameters: ExOpenAI.Components.FineTuneSupervisedHyperparameters.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:hyperparameters) =>
                ExOpenAI.Components.FineTuneSupervisedHyperparameters.input()
            }
  defstruct [:hyperparameters]
end
