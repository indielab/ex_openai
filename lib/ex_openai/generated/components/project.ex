defmodule ExOpenAI.Components.Project do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual project.

  ## Fields

  * `:archived_at` - **optional** - `integer() | nil`

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the project was created.
    Format: `unixtime`

  * `:external_key_id` - **optional** - `String.t() | nil`
    The external key associated with the project.

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:name` - **optional** - `String.t() | nil`
    The name of the project. This appears in reporting.

  * `:object` - **required** - `:"organization.project"`
    The object type, which is always `organization.project`
    Allowed values: `"organization.project"`

  * `:status` - **optional** - `String.t() | nil`
    `active` or `archived`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          archived_at: (integer() | nil) | nil,
          created_at: integer(),
          external_key_id: (String.t() | nil) | nil,
          id: String.t(),
          name: (String.t() | nil) | nil,
          object: :"organization.project",
          status: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:archived_at) => integer() | nil,
              required(:created_at) => integer(),
              optional(:external_key_id) => String.t() | nil,
              required(:id) => String.t(),
              optional(:name) => String.t() | nil,
              required(:object) => :"organization.project" | String.t(),
              optional(:status) => String.t() | nil
            }
  defstruct [:archived_at, :created_at, :external_key_id, :id, :name, :object, :status]
end
