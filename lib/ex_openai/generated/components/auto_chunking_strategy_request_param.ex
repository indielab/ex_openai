defmodule ExOpenAI.Components.AutoChunkingStrategyRequestParam do
  use ExOpenAI.Jason

  @moduledoc """
  The default strategy. This strategy currently uses a `max_chunk_size_tokens` of `800` and `chunk_overlap_tokens` of `400`.

  ## Fields

  * `:type` - **required** - `:auto`
    Always `auto`.
    Allowed values: `"auto"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :auto}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :auto | String.t()}
  defstruct [:type]
end
