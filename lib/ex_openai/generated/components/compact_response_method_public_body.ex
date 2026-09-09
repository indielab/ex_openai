defmodule ExOpenAI.Components.CompactResponseMethodPublicBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CompactResponseMethodPublicBody.

  ## Fields

  * `:input` - **optional** - `String.t() | list(ExOpenAI.Components.InputItem.t()) | nil`

  * `:instructions` - **optional** - `String.t() | nil`

  * `:model` - **required** - `ExOpenAI.Components.ModelIdsCompaction.t()`

  * `:previous_response_id` - **optional** - `String.t() | nil`

  * `:prompt_cache_key` - **optional** - `String.t() | nil`

  * `:prompt_cache_options` - **optional** - `ExOpenAI.Components.PromptCacheOptionsParam.t() | nil`

  * `:prompt_cache_retention` - **optional** - `ExOpenAI.Components.PromptCacheRetentionEnum.t() | nil`

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTierEnum.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: ((String.t() | list(ExOpenAI.Components.InputItem.t())) | nil) | nil,
          instructions: (String.t() | nil) | nil,
          model: ExOpenAI.Components.ModelIdsCompaction.t(),
          previous_response_id: (String.t() | nil) | nil,
          prompt_cache_key: (String.t() | nil) | nil,
          prompt_cache_options: (ExOpenAI.Components.PromptCacheOptionsParam.t() | nil) | nil,
          prompt_cache_retention: (ExOpenAI.Components.PromptCacheRetentionEnum.t() | nil) | nil,
          service_tier: (ExOpenAI.Components.ServiceTierEnum.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:input) =>
                (String.t() | list(ExOpenAI.Components.InputItem.input())) | nil,
              optional(:instructions) => String.t() | nil,
              required(:model) => ExOpenAI.Components.ModelIdsCompaction.input(),
              optional(:previous_response_id) => String.t() | nil,
              optional(:prompt_cache_key) => String.t() | nil,
              optional(:prompt_cache_options) =>
                ExOpenAI.Components.PromptCacheOptionsParam.input() | nil,
              optional(:prompt_cache_retention) =>
                ExOpenAI.Components.PromptCacheRetentionEnum.input() | nil,
              optional(:service_tier) => ExOpenAI.Components.ServiceTierEnum.input() | nil
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
