defmodule ExOpenAI.Components.StaticChunkingStrategyResponseParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema StaticChunkingStrategyResponseParam.

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
