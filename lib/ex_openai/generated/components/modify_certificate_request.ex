defmodule ExOpenAI.Components.ModifyCertificateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyCertificateRequest.

  ## Fields

  * `:name` - **required** - `String.t()`  
    The updated name for the certificate
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t()}
  defstruct [:name]
end
