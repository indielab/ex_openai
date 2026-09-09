defmodule ExOpenAI.Components.Reasoning do
  use ExOpenAI.Jason

  @moduledoc """
  **gpt-5 and o-series models only**

  Configuration options for
  [reasoning models](https://platform.openai.com/docs/guides/reasoning).


  ## Fields

  * `:context` - **optional** - `:auto | :current_turn | :all_turns | nil`

  * `:effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t()`

  * `:generate_summary` - **optional** - `:auto | :concise | :detailed | nil`

  * `:mode` - **optional** - `ExOpenAI.Components.ReasoningModeEnum.t()`
    Controls the reasoning execution mode for the request.

  When returned on a response, this is the effective execution mode.

  * `:summary` - **optional** - `:auto | :concise | :detailed | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          context: (((:auto | :current_turn) | :all_turns) | nil) | nil,
          effort: ExOpenAI.Components.ReasoningEffort.t() | nil,
          generate_summary: (((:auto | :concise) | :detailed) | nil) | nil,
          mode: ExOpenAI.Components.ReasoningModeEnum.t() | nil,
          summary: (((:auto | :concise) | :detailed) | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:context) => (((:auto | :current_turn) | :all_turns) | String.t()) | nil,
              optional(:effort) => ExOpenAI.Components.ReasoningEffort.input(),
              optional(:generate_summary) =>
                (((:auto | :concise) | :detailed) | String.t()) | nil,
              optional(:mode) => ExOpenAI.Components.ReasoningModeEnum.input(),
              optional(:summary) => (((:auto | :concise) | :detailed) | String.t()) | nil
            }
  defstruct [:context, :effort, :generate_summary, :mode, :summary]
end
