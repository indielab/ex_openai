defmodule ExOpenAI.Components.UsageCompletionsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated completions usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | any()`

  * `:batch` - **optional** - `boolean() | any()`

  * `:input_audio_tokens` - **optional** - `integer()`  
    The aggregated number of audio input tokens used, including cached tokens.

  * `:input_cached_tokens` - **optional** - `integer()`  
    The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.

  * `:input_tokens` - **required** - `integer()`  
    The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.

  * `:model` - **optional** - `String.t() | any()`

  * `:num_model_requests` - **required** - `integer()`  
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.completions.result"`  
    Allowed values: `"organization.usage.completions.result"`

  * `:output_audio_tokens` - **optional** - `integer()`  
    The aggregated number of audio output tokens used.

  * `:output_tokens` - **required** - `integer()`  
    The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.

  * `:project_id` - **optional** - `String.t() | any()`

  * `:service_tier` - **optional** - `String.t() | any()`

  * `:user_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | any()) | nil,
          batch: (boolean() | any()) | nil,
          input_audio_tokens: integer() | nil,
          input_cached_tokens: integer() | nil,
          input_tokens: integer(),
          model: (String.t() | any()) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.completions.result",
          output_audio_tokens: integer() | nil,
          output_tokens: integer(),
          project_id: (String.t() | any()) | nil,
          service_tier: (String.t() | any()) | nil,
          user_id: (String.t() | any()) | nil
        }
  defstruct [
    :api_key_id,
    :batch,
    :input_audio_tokens,
    :input_cached_tokens,
    :input_tokens,
    :model,
    :num_model_requests,
    :object,
    :output_audio_tokens,
    :output_tokens,
    :project_id,
    :service_tier,
    :user_id
  ]
end
