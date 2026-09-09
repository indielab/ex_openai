defmodule ExOpenAI.Components.OrganizationCertificateDeactivationResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OrganizationCertificateDeactivationResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.OrganizationCertificate.t())`

  * `:object` - **required** - `:"organization.certificate.deactivation"`
    The organization certificate deactivation result type.
    Allowed values: `"organization.certificate.deactivation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.OrganizationCertificate.t()),
          object: :"organization.certificate.deactivation"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.OrganizationCertificate.input()),
              required(:object) => :"organization.certificate.deactivation" | String.t()
            }
  defstruct [:data, :object]
end
