defmodule ExOpenAI.Components.ModelResponseProperties do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModelResponseProperties.

  ## Fields

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:prompt_cache_key` - **optional** - `String.t()`  
    Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).

  * `:prompt_cache_retention` - **optional** - `:"in-memory" | :"24h" | any()`

  * `:safety_identifier` - **optional** - `String.t()`  
    A stable identifier used to help detect users of your application that may be violating OpenAI's usage policies.
  The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).  
    Constraints: maxLength: 64

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.t()`

  * `:temperature` - **optional** - `number() | any()`

  * `:top_logprobs` - **optional** - `integer() | any()`

  * `:top_p` - **optional** - `number() | any()`

  * `:user` - **optional** - `String.t()`  
    This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use `prompt_cache_key` instead to maintain caching optimizations.
  A stable identifier for your end-users.
  Used to boost cache hit rates by better bucketing similar requests and  to help OpenAI detect and prevent abuse. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          prompt_cache_key: String.t() | nil,
          prompt_cache_retention: ((:"in-memory" | :"24h") | any()) | nil,
          safety_identifier: String.t() | nil,
          service_tier: ExOpenAI.Components.ServiceTier.t() | nil,
          temperature: (number() | any()) | nil,
          top_logprobs: (integer() | any()) | nil,
          top_p: (number() | any()) | nil,
          user: String.t() | nil
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
