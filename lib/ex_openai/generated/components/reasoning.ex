defmodule ExOpenAI.Components.Reasoning do
  use ExOpenAI.Jason

  @moduledoc """
  **gpt-5 and o-series models only**

  Configuration options for
  [reasoning models](https://platform.openai.com/docs/guides/reasoning).


  ## Fields

  * `:effort` - **optional** - `ExOpenAI.Components.ReasoningEffort.t()`

  * `:generate_summary` - **optional** - `:auto | :concise | :detailed | any()`

  * `:summary` - **optional** - `:auto | :concise | :detailed | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          effort: ExOpenAI.Components.ReasoningEffort.t() | nil,
          generate_summary: (((:auto | :concise) | :detailed) | any()) | nil,
          summary: (((:auto | :concise) | :detailed) | any()) | nil
        }
  defstruct [:effort, :generate_summary, :summary]
end
