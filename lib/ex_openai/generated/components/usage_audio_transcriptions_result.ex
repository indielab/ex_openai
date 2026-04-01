defmodule ExOpenAI.Components.UsageAudioTranscriptionsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated audio transcriptions usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | any()`

  * `:model` - **optional** - `String.t() | any()`

  * `:num_model_requests` - **required** - `integer()`  
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.audio_transcriptions.result"`  
    Allowed values: `"organization.usage.audio_transcriptions.result"`

  * `:project_id` - **optional** - `String.t() | any()`

  * `:seconds` - **required** - `integer()`  
    The number of seconds processed.

  * `:user_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | any()) | nil,
          model: (String.t() | any()) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.audio_transcriptions.result",
          project_id: (String.t() | any()) | nil,
          seconds: integer(),
          user_id: (String.t() | any()) | nil
        }
  defstruct [:api_key_id, :model, :num_model_requests, :object, :project_id, :seconds, :user_id]
end
