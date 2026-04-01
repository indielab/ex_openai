defmodule ExOpenAI.Components.UploadCertificateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UploadCertificateRequest.

  ## Fields

  * `:content` - **required** - `String.t()`  
    The certificate content in PEM format

  * `:name` - **optional** - `String.t()`  
    An optional name for the certificate
  """
  @type t() :: %{__struct__: __MODULE__, content: String.t(), name: String.t() | nil}
  defstruct [:content, :name]
end
