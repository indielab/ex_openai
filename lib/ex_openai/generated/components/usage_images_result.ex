defmodule ExOpenAI.Components.UsageImagesResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated images usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:images` - **required** - `integer()`
    The number of images processed.

  * `:model` - **optional** - `String.t() | nil`

  * `:num_model_requests` - **required** - `integer()`
    The count of requests made to the model.

  * `:object` - **required** - `:"organization.usage.images.result"`
    Allowed values: `"organization.usage.images.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:size` - **optional** - `String.t() | nil`

  * `:source` - **optional** - `String.t() | nil`

  * `:user_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          images: integer(),
          model: (String.t() | nil) | nil,
          num_model_requests: integer(),
          object: :"organization.usage.images.result",
          project_id: (String.t() | nil) | nil,
          size: (String.t() | nil) | nil,
          source: (String.t() | nil) | nil,
          user_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              required(:images) => integer(),
              optional(:model) => String.t() | nil,
              required(:num_model_requests) => integer(),
              required(:object) => :"organization.usage.images.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              optional(:size) => String.t() | nil,
              optional(:source) => String.t() | nil,
              optional(:user_id) => String.t() | nil
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
