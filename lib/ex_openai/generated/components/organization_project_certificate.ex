defmodule ExOpenAI.Components.OrganizationProjectCertificate do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual certificate configured at the project level.

  ## Fields

  * `:active` - **required** - `boolean()`
    Whether the certificate is currently active at the project level.

  * `:certificate_details` - **required** - `%{optional(:expires_at) => integer(), optional(:valid_at) => integer()}`

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the certificate was uploaded.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t() | nil`
    The name of the certificate.

  * `:object` - **required** - `:"organization.project.certificate"`
    The object type, which is always `organization.project.certificate`.
    Allowed values: `"organization.project.certificate"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          active: boolean(),
          certificate_details: %{
            optional(:expires_at) => integer(),
            optional(:valid_at) => integer()
          },
          created_at: integer(),
          id: String.t(),
          name: String.t() | nil,
          object: :"organization.project.certificate"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:active) => boolean(),
              required(:certificate_details) => %{
                optional(:expires_at) => integer(),
                optional(:valid_at) => integer()
              },
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:name) => String.t() | nil,
              required(:object) => :"organization.project.certificate" | String.t()
            }
  defstruct [:active, :certificate_details, :created_at, :id, :name, :object]
end
