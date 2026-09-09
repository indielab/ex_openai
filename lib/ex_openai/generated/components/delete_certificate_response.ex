defmodule ExOpenAI.Components.DeleteCertificateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteCertificateResponse.

  ## Fields

  * `:id` - **required** - `String.t()`
    The ID of the certificate that was deleted.

  * `:object` - **required** - `:"certificate.deleted"`
    The object type, must be `certificate.deleted`.
    Allowed values: `"certificate.deleted"`
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t(), object: :"certificate.deleted"}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:id) => String.t(),
              required(:object) => :"certificate.deleted" | String.t()
            }
  defstruct [:id, :object]
end
