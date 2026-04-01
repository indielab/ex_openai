defmodule ExOpenAI.Components.FineTuneDPOMethod do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for the DPO fine-tuning method.

  ## Fields

  * `:hyperparameters` - **optional** - `ExOpenAI.Components.FineTuneDPOHyperparameters.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          hyperparameters: ExOpenAI.Components.FineTuneDPOHyperparameters.t() | nil
        }
  defstruct [:hyperparameters]
end
