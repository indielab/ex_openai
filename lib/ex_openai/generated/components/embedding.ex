defmodule ExOpenAI.Components.Embedding do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an embedding vector returned by embedding endpoint.


  ## Fields

  * `:embedding` - **required** - `list(number())`
    The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](https://platform.openai.com/docs/guides/embeddings).

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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:embedding) => list(number()),
              required(:index) => integer(),
              required(:object) => :embedding | String.t()
            }
  defstruct [:embedding, :index, :object]
end
