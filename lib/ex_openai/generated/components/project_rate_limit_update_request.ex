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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:batch_1_day_max_input_tokens) => integer(),
              optional(:max_audio_megabytes_per_1_minute) => integer(),
              optional(:max_images_per_1_minute) => integer(),
              optional(:max_requests_per_1_day) => integer(),
              optional(:max_requests_per_1_minute) => integer(),
              optional(:max_tokens_per_1_minute) => integer()
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
