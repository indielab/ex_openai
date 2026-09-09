defmodule ExOpenAI.Components.UsageModerationsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated moderations usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:input_tokens` - **required** - `integer()`
    The aggregated number of input tokens used.

  * `:model` - **optional** - `String.t() | nil`

  * `:num_model_requests` - **required** - `integer()`
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.moderations.result"`
    Allowed values: `"organization.usage.moderations.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:user_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          input_tokens: integer(),
          model: (String.t() | nil) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.moderations.result",
          project_id: (String.t() | nil) | nil,
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              required(:input_tokens) => integer(),
              optional(:model) => String.t() | nil,
              required(:num_model_requests) => integer(),
              required(:object) => :"organization.usage.moderations.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              optional(:user_id) => String.t() | nil
            }
  defstruct [
    :api_key_id,
    :input_tokens,
    :model,
    :num_model_requests,
    :object,
    :project_id,
    :user_id
  ]
end
