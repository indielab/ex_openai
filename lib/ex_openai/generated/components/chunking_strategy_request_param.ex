defmodule ExOpenAI.Components.ChunkingStrategyRequestParam do
  @moduledoc """
  The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
  """
  @type t() :: map()
  @type input() ::
          ExOpenAI.Components.AutoChunkingStrategyRequestParam.input()
          | ExOpenAI.Components.StaticChunkingStrategyRequestParam.input()
end
