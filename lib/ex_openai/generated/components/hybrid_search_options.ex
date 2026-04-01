defmodule ExOpenAI.Components.HybridSearchOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema HybridSearchOptions.

  ## Fields

  * `:embedding_weight` - **required** - `number()`  
    The weight of the embedding in the reciprocal ranking fusion.

  * `:text_weight` - **required** - `number()`  
    The weight of the text in the reciprocal ranking fusion.
  """
  @type t() :: %{__struct__: __MODULE__, embedding_weight: number(), text_weight: number()}
  defstruct [:embedding_weight, :text_weight]
end
