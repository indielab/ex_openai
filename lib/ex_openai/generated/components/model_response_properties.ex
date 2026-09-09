defmodule ExOpenAI.Components.ModelResponseProperties do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModelResponseProperties.

  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:prompt_cache_key` - **optional** - `String.t() | nil`

  * `:prompt_cache_retention` - **optional** - `:in_memory | :"24h" | nil`

  * `:safety_identifier` - **optional** - `String.t() | nil`

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.t()`

  * `:temperature` - **optional** - `number() | nil`

  * `:top_logprobs` - **optional** - `integer() | nil`

  * `:top_p` - **optional** - `number() | nil`

  * `:user` - **optional** - `String.t()`
    This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
  A stable identifier for your end-users.
  Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          prompt_cache_key: (String.t() | nil) | nil,
          prompt_cache_retention: ((:in_memory | :"24h") | nil) | nil,
          safety_identifier: (String.t() | nil) | nil,
          service_tier: ExOpenAI.Components.ServiceTier.t() | nil,
          temperature: (number() | nil) | nil,
          top_logprobs: (integer() | nil) | nil,
          top_p: (number() | nil) | nil,
          user: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:prompt_cache_key) => String.t() | nil,
              optional(:prompt_cache_retention) => ((:in_memory | :"24h") | String.t()) | nil,
              optional(:safety_identifier) => String.t() | nil,
              optional(:service_tier) => ExOpenAI.Components.ServiceTier.input(),
              optional(:temperature) => number() | nil,
              optional(:top_logprobs) => integer() | nil,
              optional(:top_p) => number() | nil,
              optional(:user) => String.t()
            }
  defstruct [
    :metadata,
    :prompt_cache_key,
    :prompt_cache_retention,
    :safety_identifier,
    :service_tier,
    :temperature,
    :top_logprobs,
    :top_p,
    :user
  ]
end
