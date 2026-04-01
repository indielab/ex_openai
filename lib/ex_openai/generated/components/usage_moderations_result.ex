defmodule ExOpenAI.Components.UsageModerationsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated moderations usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | any()`

  * `:input_tokens` - **required** - `integer()`  
    The aggregated number of input tokens used.

  * `:model` - **optional** - `String.t() | any()`

  * `:num_model_requests` - **required** - `integer()`  
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.moderations.result"`  
    Allowed values: `"organization.usage.moderations.result"`

  * `:project_id` - **optional** - `String.t() | any()`

  * `:user_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | any()) | nil,
          input_tokens: integer(),
          model: (String.t() | any()) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.moderations.result",
          project_id: (String.t() | any()) | nil,
          user_id: (String.t() | any()) | nil
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
