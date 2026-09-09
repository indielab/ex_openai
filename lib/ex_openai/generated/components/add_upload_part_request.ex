defmodule ExOpenAI.Components.AddUploadPartRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AddUploadPartRequest.

  ## Fields

  * `:data` - **required** - `binary()`
    The chunk of bytes for this Part.
    Format: `binary`
  """
  @type t() :: %{__struct__: __MODULE__, data: binary()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:data) => binary() | {String.t(), binary()}}
  defstruct [:data]
end
