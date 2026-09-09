defmodule ExOpenAI.Components.OrganizationCertificateActivationResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OrganizationCertificateActivationResponse.

  ## Fields

  * `:data` - **required** - `list(ExOpenAI.Components.OrganizationCertificate.t())`

  * `:object` - **required** - `:"organization.certificate.activation"`
    The organization certificate activation result type.
    Allowed values: `"organization.certificate.activation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.OrganizationCertificate.t()),
          object: :"organization.certificate.activation"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => list(ExOpenAI.Components.OrganizationCertificate.input()),
              required(:object) => :"organization.certificate.activation" | String.t()
            }
  defstruct [:data, :object]
end
