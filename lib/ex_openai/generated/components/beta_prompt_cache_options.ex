defmodule ExOpenAI.Components.BetaPromptCacheOptions do
  use ExOpenAI.Jason

  @moduledoc """
  The prompt-caching options that were applied to the response. Supported for `gpt-5.6` and later models.

  ## Fields

  * `:mode` - **required** - `ExOpenAI.Components.BetaPromptCacheModeEnum.t()`
    Whether implicit prompt-cache breakpoints were enabled.

  * `:ttl` - **required** - `ExOpenAI.Components.BetaPromptCacheTTLEnum.t()`
    The minimum lifetime applied to each cache breakpoint.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          mode: ExOpenAI.Components.BetaPromptCacheModeEnum.t(),
          ttl: ExOpenAI.Components.BetaPromptCacheTTLEnum.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:mode) => ExOpenAI.Components.BetaPromptCacheModeEnum.input(),
              required(:ttl) => ExOpenAI.Components.BetaPromptCacheTTLEnum.input()
            }
  defstruct [:mode, :ttl]
end
