defmodule ExOpenAI.Components.InputFileContentParam do
  use ExOpenAI.Jason

  @moduledoc """
  A file input to the model.

  ## Fields

  * `:file_data` - **optional** - `String.t() | any()`

  * `:file_id` - **optional** - `String.t() | any()`

  * `:file_url` - **optional** - `String.t() | any()`

  * `:filename` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:input_file`  
    The type of the input item. Always `input_file`.  
    Allowed values: `"input_file"`  
    Default: `"input_file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_data: (String.t() | any()) | nil,
          file_id: (String.t() | any()) | nil,
          file_url: (String.t() | any()) | nil,
          filename: (String.t() | any()) | nil,
          type: :input_file
        }
  defstruct [:file_data, :file_id, :file_url, :filename, :type]
end
