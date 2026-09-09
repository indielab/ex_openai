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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:dpo) => ExOpenAI.Components.FineTuneDPOMethod.input(),
              optional(:reinforcement) => ExOpenAI.Components.FineTuneReinforcementMethod.input(),
              optional(:supervised) => ExOpenAI.Components.FineTuneSupervisedMethod.input(),
              required(:type) => ((:supervised | :dpo) | :reinforcement) | String.t()
            }
  defstruct [:dpo, :reinforcement, :supervised, :type]
end
