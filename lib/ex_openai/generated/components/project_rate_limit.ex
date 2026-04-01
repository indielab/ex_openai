defmodule ExOpenAI.Components.ProjectRateLimit do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a project rate limit config.

  ## Fields

  * `:batch_1_day_max_input_tokens` - **optional** - `integer()`  
    The maximum batch input tokens per day. Only present for relevant models.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints.

  * `:max_audio_megabytes_per_1_minute` - **optional** - `integer()`  
    The maximum audio megabytes per minute. Only present for relevant models.

  * `:max_images_per_1_minute` - **optional** - `integer()`  
    The maximum images per minute. Only present for relevant models.

  * `:max_requests_per_1_day` - **optional** - `integer()`  
    The maximum requests per day. Only present for relevant models.

  * `:max_requests_per_1_minute` - **required** - `integer()`  
    The maximum requests per minute.

  * `:max_tokens_per_1_minute` - **required** - `integer()`  
    The maximum tokens per minute.

  * `:model` - **required** - `String.t()`  
    The model this rate limit applies to.

  * `:object` - **required** - `:"project.rate_limit"`  
    The object type, which is always `project.rate_limit`  
    Allowed values: `"project.rate_limit"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          batch_1_day_max_input_tokens: integer() | nil,
          id: String.t(),
          max_audio_megabytes_per_1_minute: integer() | nil,
          max_images_per_1_minute: integer() | nil,
          max_requests_per_1_day: integer() | nil,
          max_requests_per_1_minute: integer(),
          max_tokens_per_1_minute: integer(),
          model: String.t(),
          object: :"project.rate_limit"
        }
  defstruct [
    :batch_1_day_max_input_tokens,
    :id,
    :max_audio_megabytes_per_1_minute,
    :max_images_per_1_minute,
    :max_requests_per_1_day,
    :max_requests_per_1_minute,
    :max_tokens_per_1_minute,
    :model,
    :object
  ]
end
