defmodule ExOpenAI.Components.UsageAudioTranscriptionsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated audio transcriptions usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:model` - **optional** - `String.t() | nil`

  * `:num_model_requests` - **required** - `integer()`
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.audio_transcriptions.result"`
    Allowed values: `"organization.usage.audio_transcriptions.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:seconds` - **required** - `integer()`
    The number of seconds processed.
    Format: `int64`

  * `:user_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          model: (String.t() | nil) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.audio_transcriptions.result",
          project_id: (String.t() | nil) | nil,
          seconds: integer(),
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              optional(:model) => String.t() | nil,
              required(:num_model_requests) => integer(),
              required(:object) => :"organization.usage.audio_transcriptions.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              required(:seconds) => integer(),
              optional(:user_id) => String.t() | nil
            }
  defstruct [:api_key_id, :model, :num_model_requests, :object, :project_id, :seconds, :user_id]
end
