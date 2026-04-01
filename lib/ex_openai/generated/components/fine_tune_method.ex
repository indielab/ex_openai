defmodule ExOpenAI.Components.FineTuneMethod do
  use ExOpenAI.Jason

  @moduledoc """
  The method used for fine-tuning.

  ## Fields

  * `:dpo` - **optional** - `ExOpenAI.Components.FineTuneDPOMethod.t()`

  * `:reinforcement` - **optional** - `ExOpenAI.Components.FineTuneReinforcementMethod.t()`

  * `:supervised` - **optional** - `ExOpenAI.Components.FineTuneSupervisedMethod.t()`

  * `:type` - **required** - `:supervised | :dpo | :reinforcement`  
    The type of method. Is either `supervised`, `dpo`, or `reinforcement`.  
    Allowed values: `"supervised"`, `"dpo"`, `"reinforcement"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          dpo: ExOpenAI.Components.FineTuneDPOMethod.t() | nil,
          reinforcement: ExOpenAI.Components.FineTuneReinforcementMethod.t() | nil,
          supervised: ExOpenAI.Components.FineTuneSupervisedMethod.t() | nil,
          type: (:supervised | :dpo) | :reinforcement
        }
  defstruct [:dpo, :reinforcement, :supervised, :type]
end
