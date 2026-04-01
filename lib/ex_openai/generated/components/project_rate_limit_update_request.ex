defmodule ExOpenAI.Components.ProjectRateLimitUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectRateLimitUpdateRequest.

  ## Fields

  * `:batch_1_day_max_input_tokens` - **optional** - `integer()`  
    The maximum batch input tokens per day. Only relevant for certain models.

  * `:max_audio_megabytes_per_1_minute` - **optional** - `integer()`  
    The maximum audio megabytes per minute. Only relevant for certain models.

  * `:max_images_per_1_minute` - **optional** - `integer()`  
    The maximum images per minute. Only relevant for certain models.

  * `:max_requests_per_1_day` - **optional** - `integer()`  
    The maximum requests per day. Only relevant for certain models.

  * `:max_requests_per_1_minute` - **optional** - `integer()`  
    The maximum requests per minute.

  * `:max_tokens_per_1_minute` - **optional** - `integer()`  
    The maximum tokens per minute.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          batch_1_day_max_input_tokens: integer() | nil,
          max_audio_megabytes_per_1_minute: integer() | nil,
          max_images_per_1_minute: integer() | nil,
          max_requests_per_1_day: integer() | nil,
          max_requests_per_1_minute: integer() | nil,
          max_tokens_per_1_minute: integer() | nil
        }
  defstruct [
    :batch_1_day_max_input_tokens,
    :max_audio_megabytes_per_1_minute,
    :max_images_per_1_minute,
    :max_requests_per_1_day,
    :max_requests_per_1_minute,
    :max_tokens_per_1_minute
  ]
end
