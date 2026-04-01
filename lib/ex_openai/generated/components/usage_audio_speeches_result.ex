defmodule ExOpenAI.Components.UsageAudioSpeechesResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated audio speeches usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | any()`

  * `:characters` - **required** - `integer()`  
    The number of characters processed.

  * `:model` - **optional** - `String.t() | any()`

  * `:num_model_requests` - **required** - `integer()`  
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.audio_speeches.result"`  
    Allowed values: `"organization.usage.audio_speeches.result"`

  * `:project_id` - **optional** - `String.t() | any()`

  * `:user_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | any()) | nil,
          characters: integer(),
          model: (String.t() | any()) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.audio_speeches.result",
          project_id: (String.t() | any()) | nil,
          user_id: (String.t() | any()) | nil
        }
  defstruct [
    :api_key_id,
    :characters,
    :model,
    :num_model_requests,
    :object,
    :project_id,
    :user_id
  ]
end
