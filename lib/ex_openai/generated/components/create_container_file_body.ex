defmodule ExOpenAI.Components.CreateContainerFileBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateContainerFileBody.

  ## Fields

  * `:file` - **optional** - `binary()`  
    The File object (not file name) to be uploaded.  
    Format: `binary`

  * `:file_id` - **optional** - `String.t()`  
    Name of the file to create.
  """
  @type t() :: %{__struct__: __MODULE__, file: binary() | nil, file_id: String.t() | nil}
  defstruct [:file, :file_id]
end
