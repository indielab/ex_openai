defmodule ExOpenAI.Components.OrganizationProjectCertificateDeactivationResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OrganizationProjectCertificateDeactivationResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.OrganizationProjectCertificate.t())`

  * `:object` - **required** - `:"organization.project.certificate.deactivation"`
    The project certificate deactivation result type.
    Allowed values: `"organization.project.certificate.deactivation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.OrganizationProjectCertificate.t()),
          object: :"organization.project.certificate.deactivation"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.OrganizationProjectCertificate.input()),
              required(:object) => :"organization.project.certificate.deactivation" | String.t()
            }
  defstruct [:data, :object]
end
