defmodule ExOpenAI.Components.UsageFileSearchCallsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated file search calls usage details of the specific time bucket.

  ## Fields

  * `:api_key_id` - **optional** - `String.t() | nil`

  * `:num_requests` - **required** - `integer()`
    The count of file search calls.

  * `:object` - **required** - `:"organization.usage.file_searches.result"`
    Allowed values: `"organization.usage.file_searches.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:user_id` - **optional** - `String.t() | nil`

  * `:vector_store_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key_id: (String.t() | nil) | nil,
          num_requests: integer(),
          object: :"organization.usage.file_searches.result",
          project_id: (String.t() | nil) | nil,
          user_id: (String.t() | nil) | nil,
          vector_store_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:api_key_id) => String.t() | nil,
              required(:num_requests) => integer(),
              required(:object) => :"organization.usage.file_searches.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              optional(:user_id) => String.t() | nil,
              optional(:vector_store_id) => String.t() | nil
            }
  defstruct [:api_key_id, :num_requests, :object, :project_id, :user_id, :vector_store_id]
end
