defmodule ExOpenAI.Components.StaticChunkingStrategy do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema StaticChunkingStrategy.

  ## Fields

  * `:chunk_overlap_tokens` - **required** - `integer()`  
    The number of tokens that overlap between chunks. The default value is `400`.

  Note that the overlap must not exceed half of `max_chunk_size_tokens`.

  * `:max_chunk_size_tokens` - **required** - `integer()`  
    The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.  
    Constraints: minimum: 100, maximum: 4096
  """
  @type t() :: %{
          __struct__: __MODULE__,
          chunk_overlap_tokens: integer(),
          max_chunk_size_tokens: integer()
        }
  defstruct [:chunk_overlap_tokens, :max_chunk_size_tokens]
end
