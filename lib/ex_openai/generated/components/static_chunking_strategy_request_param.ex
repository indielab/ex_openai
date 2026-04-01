defmodule ExOpenAI.Components.StaticChunkingStrategyRequestParam do
  use ExOpenAI.Jason

  @moduledoc """
  Customize your own chunking strategy by setting chunk size and chunk overlap.

  ## Fields

  * `:static` - **required** - `ExOpenAI.Components.StaticChunkingStrategy.t()`

  * `:type` - **required** - `:static`  
    Always `static`.  
    Allowed values: `"static"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          static: ExOpenAI.Components.StaticChunkingStrategy.t(),
          type: :static
        }
  defstruct [:static, :type]
end
