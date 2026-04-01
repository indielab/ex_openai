defmodule ExOpenAI.Components.InputFileContent do
  use ExOpenAI.Jason

  @moduledoc """
  A file input to the model.

  ## Fields

  * `:file_data` - **optional** - `String.t()`  
    The content of the file to be sent to the model.

  * `:file_id` - **optional** - `String.t() | any()`

  * `:file_url` - **optional** - `String.t()`  
    The URL of the file to be sent to the model.

  * `:filename` - **optional** - `String.t()`  
    The name of the file to be sent to the model.

  * `:type` - **required** - `:input_file`  
    The type of the input item. Always `input_file`.  
    Allowed values: `"input_file"`  
    Default: `"input_file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_data: String.t() | nil,
          file_id: (String.t() | any()) | nil,
          file_url: String.t() | nil,
          filename: String.t() | nil,
          type: :input_file
        }
  defstruct [:file_data, :file_id, :file_url, :filename, :type]
end
