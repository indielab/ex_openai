defmodule ExOpenAI.Components.UsageAudioSpeechesResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated audio speeches usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:characters` - **required** - `integer()`
    The number of characters processed.

  * `:model` - **optional** - `String.t() | nil`

  * `:num_model_requests` - **required** - `integer()`
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.audio_speeches.result"`
    Allowed values: `"organization.usage.audio_speeches.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:user_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          characters: integer(),
          model: (String.t() | nil) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.audio_speeches.result",
          project_id: (String.t() | nil) | nil,
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              required(:characters) => integer(),
              optional(:model) => String.t() | nil,
              required(:num_model_requests) => integer(),
              required(:object) => :"organization.usage.audio_speeches.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              optional(:user_id) => String.t() | nil
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
