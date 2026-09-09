defmodule ExOpenAI.Components.UploadCertificateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UploadCertificateRequest.

  ## Fields

  * `:certificate` - **required** - `String.t()`
    The certificate content in PEM format

  * `:name` - **optional** - `String.t()`
    An optional name for the certificate
  """
  @type t() :: %{__struct__: __MODULE__, certificate: String.t(), name: String.t() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:certificate) => String.t(), optional(:name) => String.t()}
  defstruct [:certificate, :name]
end
