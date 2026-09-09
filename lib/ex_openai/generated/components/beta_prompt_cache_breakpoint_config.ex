defmodule ExOpenAI.Components.BetaPromptCacheBreakpointConfig do
  use ExOpenAI.Jason

  @moduledoc """
  Marks the exact end of a reusable prompt prefix. The breakpoint inherits its TTL from the request's `prompt_cache_options.ttl`; the boundary is not rounded to a token block.

  ## Fields

  * `:mode` - **required** - `:explicit`
    The breakpoint mode. Always `explicit`.
    Allowed values: `"explicit"`
    Default: `"explicit"`
  """
  @type t() :: %{__struct__: __MODULE__, mode: :explicit}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:mode) => :explicit | String.t()}
  defstruct [:mode]
end
