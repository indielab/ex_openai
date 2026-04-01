defmodule ExOpenAI.Components.Embedding do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an embedding vector returned by embedding endpoint.


  ## Fields

  * `:embedding` - **required** - `[number()]`  
    The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](/docs/guides/embeddings).

  * `:index` - **required** - `integer()`  
    The index of the embedding in the list of embeddings.

  * `:object` - **required** - `:embedding`  
    The object type, which is always "embedding".  
    Allowed values: `"embedding"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          embedding: list(number()),
          index: integer(),
          object: :embedding
        }
  defstruct [:embedding, :index, :object]
end
