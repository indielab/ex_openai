defmodule ExOpenAI.Components.ChunkingStrategyRequestParam do
  use ExOpenAI.Jason

  @moduledoc """
  The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
  """
  @type t() :: map()
end
