defmodule ExOpenAI.Components.BetaReasoning do
  use ExOpenAI.Jason

  @moduledoc """
  **gpt-5 and o-series models only**

  Configuration options for
  [reasoning models](https://platform.openai.com/docs/guides/reasoning).


  ## Fields

  * `:context` - **optional** - `:auto | :current_turn | :all_turns | nil`

  * `:effort` - **optional** - `ExOpenAI.Components.BetaReasoningEffort.t()`

  * `:generate_summary` - **optional** - `:auto | :concise | :detailed | nil`

  * `:mode` - **optional** - `ExOpenAI.Components.BetaReasoningModeEnum.t()`
    Controls the reasoning execution mode for the request.

  When returned on a response, this is the effective execution mode.

  * `:summary` - **optional** - `:auto | :concise | :detailed | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          context: (((:auto | :current_turn) | :all_turns) | nil) | nil,
          effort: ExOpenAI.Components.BetaReasoningEffort.t() | nil,
          generate_summary: (((:auto | :concise) | :detailed) | nil) | nil,
          mode: ExOpenAI.Components.BetaReasoningModeEnum.t() | nil,
          summary: (((:auto | :concise) | :detailed) | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:context) => (((:auto | :current_turn) | :all_turns) | String.t()) | nil,
              optional(:effort) => ExOpenAI.Components.BetaReasoningEffort.input(),
              optional(:generate_summary) =>
                (((:auto | :concise) | :detailed) | String.t()) | nil,
              optional(:mode) => ExOpenAI.Components.BetaReasoningModeEnum.input(),
              optional(:summary) => (((:auto | :concise) | :detailed) | String.t()) | nil
            }
  defstruct [:context, :effort, :generate_summary, :mode, :summary]
end
