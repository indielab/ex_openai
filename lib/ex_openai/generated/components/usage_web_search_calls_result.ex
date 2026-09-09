defmodule ExOpenAI.Components.UsageWebSearchCallsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated web search calls usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:context_level` - **optional** - `String.t() | nil`

  * `:model` - **optional** - `String.t() | nil`

  * `:num_model_requests` - **required** - `integer()`
    The count of model requests.

  * `:num_requests` - **required** - `integer()`
    The count of web search calls.

  * `:object` - **required** - `:"organization.usage.web_searches.result"`
    Allowed values: `"organization.usage.web_searches.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:user_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          context_level: (String.t() | nil) | nil,
          model: (String.t() | nil) | nil,
          num_model_requests: integer(),
          num_requests: integer(),
          object: :"organization.usage.web_searches.result",
          project_id: (String.t() | nil) | nil,
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              optional(:context_level) => String.t() | nil,
              optional(:model) => String.t() | nil,
              required(:num_model_requests) => integer(),
              required(:num_requests) => integer(),
              required(:object) => :"organization.usage.web_searches.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              optional(:user_id) => String.t() | nil
            }
  defstruct [
    :api_key_id,
    :context_level,
    :model,
    :num_model_requests,
    :num_requests,
    :object,
    :project_id,
    :user_id
  ]
end
