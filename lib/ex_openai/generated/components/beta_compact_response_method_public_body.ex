defmodule ExOpenAI.Components.BetaCompactResponseMethodPublicBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaCompactResponseMethodPublicBody.

  ## Fields

  * `:input` - **optional** - `String.t() | list(ExOpenAI.Components.BetaInputItem.t()) | nil`

  * `:instructions` - **optional** - `String.t() | nil`

  * `:model` - **required** - `ExOpenAI.Components.BetaModelIdsCompaction.t()`

  * `:previous_response_id` - **optional** - `String.t() | nil`

  * `:prompt_cache_key` - **optional** - `String.t() | nil`

  * `:prompt_cache_options` - **optional** - `ExOpenAI.Components.BetaPromptCacheOptionsParam.t() | nil`

  * `:prompt_cache_retention` - **optional** - `ExOpenAI.Components.BetaPromptCacheRetentionEnum.t() | nil`

  * `:service_tier` - **optional** - `ExOpenAI.Components.BetaServiceTierEnum.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: ((String.t() | list(ExOpenAI.Components.BetaInputItem.t())) | nil) | nil,
          instructions: (String.t() | nil) | nil,
          model: ExOpenAI.Components.BetaModelIdsCompaction.t(),
          previous_response_id: (String.t() | nil) | nil,
          prompt_cache_key: (String.t() | nil) | nil,
          prompt_cache_options: (ExOpenAI.Components.BetaPromptCacheOptionsParam.t() | nil) | nil,
          prompt_cache_retention:
            (ExOpenAI.Components.BetaPromptCacheRetentionEnum.t() | nil) | nil,
          service_tier: (ExOpenAI.Components.BetaServiceTierEnum.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:input) =>
                (String.t() | list(ExOpenAI.Components.BetaInputItem.input())) | nil,
              optional(:instructions) => String.t() | nil,
              required(:model) => ExOpenAI.Components.BetaModelIdsCompaction.input(),
              optional(:previous_response_id) => String.t() | nil,
              optional(:prompt_cache_key) => String.t() | nil,
              optional(:prompt_cache_options) =>
                ExOpenAI.Components.BetaPromptCacheOptionsParam.input() | nil,
              optional(:prompt_cache_retention) =>
                ExOpenAI.Components.BetaPromptCacheRetentionEnum.input() | nil,
              optional(:service_tier) => ExOpenAI.Components.BetaServiceTierEnum.input() | nil
            }
  defstruct [
    :input,
    :instructions,
    :model,
    :previous_response_id,
    :prompt_cache_key,
    :prompt_cache_options,
    :prompt_cache_retention,
    :service_tier
  ]
end
