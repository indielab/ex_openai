defmodule ExOpenAI.Components.FileUploadParam do
  use ExOpenAI.Jason

  @moduledoc """
  Controls whether users can upload files.

  ## Fields

  * `:enabled` - **optional** - `boolean()`  
    Enable uploads for this session. Defaults to false.

  * `:max_file_size` - **optional** - `integer()`  
    Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.  
    Constraints: minimum: 1, maximum: 512

  * `:max_files` - **optional** - `integer()`  
    Maximum number of files that can be uploaded to the session. Defaults to 10.  
    Constraints: minimum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          enabled: boolean() | nil,
          max_file_size: integer() | nil,
          max_files: integer() | nil
        }
  defstruct [:enabled, :max_file_size, :max_files]
end
