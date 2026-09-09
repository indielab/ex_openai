defmodule ExOpenAI.Components.PromptCacheOptions do
  use ExOpenAI.Jason

  @moduledoc """
  The prompt-caching options that were applied to the response. Supported for `gpt-5.6` and later models.

  ## Fields

  * `:mode` - **required** - `ExOpenAI.Components.PromptCacheModeEnum.t()`
    Whether implicit prompt-cache breakpoints were enabled.

  * `:ttl` - **required** - `ExOpenAI.Components.PromptCacheTTLEnum.t()`
    The minimum lifetime applied to each cache breakpoint.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          mode: ExOpenAI.Components.PromptCacheModeEnum.t(),
          ttl: ExOpenAI.Components.PromptCacheTTLEnum.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:mode) => ExOpenAI.Components.PromptCacheModeEnum.input(),
              required(:ttl) => ExOpenAI.Components.PromptCacheTTLEnum.input()
            }
  defstruct [:mode, :ttl]
end
