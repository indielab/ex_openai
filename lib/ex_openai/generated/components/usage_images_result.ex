defmodule ExOpenAI.Components.UsageImagesResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated images usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | any()`

  * `:images` - **required** - `integer()`  
    The number of images processed.

  * `:model` - **optional** - `String.t() | any()`

  * `:num_model_requests` - **required** - `integer()`  
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.images.result"`  
    Allowed values: `"organization.usage.images.result"`

  * `:project_id` - **optional** - `String.t() | any()`

  * `:size` - **optional** - `String.t() | any()`

  * `:source` - **optional** - `String.t() | any()`

  * `:user_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | any()) | nil,
          images: integer(),
          model: (String.t() | any()) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.images.result",
          project_id: (String.t() | any()) | nil,
          size: (String.t() | any()) | nil,
          source: (String.t() | any()) | nil,
          user_id: (String.t() | any()) | nil
        }
  defstruct [
    :api_key_id,
    :images,
    :model,
    :num_model_requests,
    :object,
    :project_id,
    :size,
    :source,
    :user_id
  ]
end
