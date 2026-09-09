defmodule ExOpenAI.Components.OtherChunkingStrategyResponseParam do
  use ExOpenAI.Jason

  @moduledoc """
  This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking_strategy` concept was introduced in the API.

  ## Fields

  * `:type` - **required** - `:other`
    Always `other`.
    Allowed values: `"other"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :other}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :other | String.t()}
  defstruct [:type]
end
