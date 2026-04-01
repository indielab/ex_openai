defmodule ExOpenAI.Components.CompleteUploadRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CompleteUploadRequest.

  ## Fields

  * `:md5` - **optional** - `String.t()`  
    The optional md5 checksum for the file contents to verify if the bytes uploaded matches what you expect.

  * `:part_ids` - **required** - `[String.t()]`  
    The ordered list of Part IDs.
  """
  @type t() :: %{__struct__: __MODULE__, md5: String.t() | nil, part_ids: list(String.t())}
  defstruct [:md5, :part_ids]
end
