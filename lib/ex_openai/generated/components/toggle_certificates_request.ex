defmodule ExOpenAI.Components.ToggleCertificatesRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToggleCertificatesRequest.

  ## Fields

  * `:certificate_ids` - **required** - `list(String.t())`
    Constraints: minItems: 1, maxItems: 10
  """
  @type t() :: %{__struct__: __MODULE__, certificate_ids: list(String.t())}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:certificate_ids) => list(String.t())}
  defstruct [:certificate_ids]
end
