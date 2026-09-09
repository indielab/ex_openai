defmodule ExOpenAI.Components.OrganizationProjectCertificateActivationResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OrganizationProjectCertificateActivationResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.OrganizationProjectCertificate.t())`

  * `:object` - **required** - `:"organization.project.certificate.activation"`
    The project certificate activation result type.
    Allowed values: `"organization.project.certificate.activation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.OrganizationProjectCertificate.t()),
          object: :"organization.project.certificate.activation"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.OrganizationProjectCertificate.input()),
              required(:object) => :"organization.project.certificate.activation" | String.t()
            }
  defstruct [:data, :object]
end
