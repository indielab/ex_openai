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
  defstruct [:id, :object]
end
