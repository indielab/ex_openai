defmodule ExOpenAI.Components.UsageCompletionsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated completions usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:batch` - **optional** - `boolean() | nil`

  * `:input_audio_tokens` - **optional** - `integer()`
    The aggregated number of uncached audio input tokens used.

  * `:input_cache_write_tokens` - **optional** - `integer()`
    The aggregated number of input tokens written to the cache.

  * `:input_cached_audio_tokens` - **optional** - `integer()`
    The aggregated number of cached audio input tokens used.

  * `:input_cached_image_tokens` - **optional** - `integer()`
    The aggregated number of cached image input tokens used.

  * `:input_cached_text_tokens` - **optional** - `integer()`
    The aggregated number of cached text input tokens used.

  * `:input_cached_tokens` - **optional** - `integer()`
    The aggregated number of cached input tokens used across text, audio, and image inputs. For customers subscribed to Scale Tier, this includes Scale Tier tokens.

  * `:input_image_tokens` - **optional** - `integer()`
    The aggregated number of uncached image input tokens used.

  * `:input_text_tokens` - **optional** - `integer()`
    The aggregated number of uncached text input tokens used, excluding cache-write tokens.

  * `:input_tokens` - **required** - `integer()`
    The aggregated number of input tokens used, including cached and cache-write tokens. This includes text, audio, and image tokens. For customers subscribed to Scale Tier, this includes Scale Tier tokens.

  * `:input_uncached_tokens` - **optional** - `integer()`
    The aggregated number of uncached input tokens used across text, audio, and image inputs, excluding cache-write tokens.

  * `:model` - **optional** - `String.t() | nil`

  * `:num_model_requests` - **required** - `integer()`
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.completions.result"`
    Allowed values: `"organization.usage.completions.result"`

  * `:output_audio_tokens` - **optional** - `integer()`
    The aggregated number of audio output tokens used.

  * `:output_image_tokens` - **optional** - `integer()`
    The aggregated number of image output tokens used.

  * `:output_text_tokens` - **optional** - `integer()`
    The aggregated number of text output tokens used.

  * `:output_tokens` - **required** - `integer()`
    The aggregated number of output tokens used across text, audio, and image outputs. For customers subscribed to Scale Tier, this includes Scale Tier tokens.

  * `:project_id` - **optional** - `String.t() | nil`

  * `:service_tier` - **optional** - `String.t() | nil`

  * `:user_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          batch: (boolean() | nil) | nil,
          input_audio_tokens: integer() | nil,
          input_cache_write_tokens: integer() | nil,
          input_cached_audio_tokens: integer() | nil,
          input_cached_image_tokens: integer() | nil,
          input_cached_text_tokens: integer() | nil,
          input_cached_tokens: integer() | nil,
          input_image_tokens: integer() | nil,
          input_text_tokens: integer() | nil,
          input_tokens: integer(),
          input_uncached_tokens: integer() | nil,
          model: (String.t() | nil) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.completions.result",
          output_audio_tokens: integer() | nil,
          output_image_tokens: integer() | nil,
          output_text_tokens: integer() | nil,
          output_tokens: integer(),
          project_id: (String.t() | nil) | nil,
          service_tier: (String.t() | nil) | nil,
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              optional(:batch) => boolean() | nil,
              optional(:input_audio_tokens) => integer(),
              optional(:input_cache_write_tokens) => integer(),
              optional(:input_cached_audio_tokens) => integer(),
              optional(:input_cached_image_tokens) => integer(),
              optional(:input_cached_text_tokens) => integer(),
              optional(:input_cached_tokens) => integer(),
              optional(:input_image_tokens) => integer(),
              optional(:input_text_tokens) => integer(),
              required(:input_tokens) => integer(),
              optional(:input_uncached_tokens) => integer(),
              optional(:model) => String.t() | nil,
              required(:num_model_requests) => integer(),
              required(:object) => :"organization.usage.completions.result" | String.t(),
              optional(:output_audio_tokens) => integer(),
              optional(:output_image_tokens) => integer(),
              optional(:output_text_tokens) => integer(),
              required(:output_tokens) => integer(),
              optional(:project_id) => String.t() | nil,
              optional(:service_tier) => String.t() | nil,
              optional(:user_id) => String.t() | nil
            }
  defstruct [
    :api_key_id,
    :batch,
    :input_audio_tokens,
    :input_cache_write_tokens,
    :input_cached_audio_tokens,
    :input_cached_image_tokens,
    :input_cached_text_tokens,
    :input_cached_tokens,
    :input_image_tokens,
    :input_text_tokens,
    :input_tokens,
    :input_uncached_tokens,
    :model,
    :num_model_requests,
    :object,
    :output_audio_tokens,
    :output_image_tokens,
    :output_text_tokens,
    :output_tokens,
    :project_id,
    :service_tier,
    :user_id
  ]
end
