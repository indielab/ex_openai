defmodule ExOpenAI.Components.BetaHybridSearchOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaHybridSearchOptions.

  ## Fields

  * `:embedding_weight` - **required** - `number()`
    The weight of the embedding in the reciprocal ranking fusion.

  * `:text_weight` - **required** - `number()`
    The weight of the text in the reciprocal ranking fusion.
  """
  @type t() :: %{__struct__: __MODULE__, embedding_weight: number(), text_weight: number()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:embedding_weight) => number(), required(:text_weight) => number()}
  defstruct [:embedding_weight, :text_weight]
end
