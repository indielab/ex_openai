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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:static) => ExOpenAI.Components.StaticChunkingStrategy.input(),
              required(:type) => :static | String.t()
            }
  defstruct [:static, :type]
end
