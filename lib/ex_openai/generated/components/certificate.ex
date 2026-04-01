defmodule ExOpenAI.Components.Certificate do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual `certificate` uploaded to the organization.

  ## Fields

  * `:active` - **optional** - `boolean()`  
    Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.

  * `:certificate_details` - **required** - `{:%{}, [], [{{:optional, [], [:content]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:expires_at]}, {:integer, [], []}}, {{:optional, [], [:valid_at]}, {:integer, [], []}}]}`

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the certificate was uploaded.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`  
    The name of the certificate.

  * `:object` - **required** - `:certificate | :"organization.certificate" | :"organization.project.certificate"`  
    The object type.

  - If creating, updating, or getting a specific certificate, the object type is `certificate`.
  - If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
  - If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.  
    Allowed values: `"certificate"`, `"organization.certificate"`, `"organization.project.certificate"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          active: boolean() | nil,
          certificate_details: %{
            optional(:content) => String.t(),
            optional(:expires_at) => integer(),
            optional(:valid_at) => integer()
          },
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object:
            (:certificate | :"organization.certificate") | :"organization.project.certificate"
        }
  defstruct [:active, :certificate_details, :created_at, :id, :name, :object]
end
