defmodule ExOpenAI.Components.ModifyCertificateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModifyCertificateRequest.

  ## Fields

  * `:name` - **optional** - `String.t()`
    The updated name for the certificate
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{optional(:name) => String.t()}
  defstruct [:name]
end
