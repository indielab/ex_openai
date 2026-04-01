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
  defstruct [:data]
end
