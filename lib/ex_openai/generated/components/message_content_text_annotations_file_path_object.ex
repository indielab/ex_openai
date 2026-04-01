defmodule ExOpenAI.Components.MessageContentTextAnnotationsFilePathObject do
  use ExOpenAI.Jason

  @moduledoc """
  A URL for the file that's generated when the assistant used the `code_interpreter` tool to generate a file.

  ## Fields

  * `:end_index` - **required** - `integer()`  
    Constraints: minimum: 0

  * `:file_path` - **required** - `{:%{}, [], [{{:required, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:start_index` - **required** - `integer()`  
    Constraints: minimum: 0

  * `:text` - **required** - `String.t()`  
    The text in the message content that needs to be replaced.

  * `:type` - **required** - `:file_path`  
    Always `file_path`.  
    Allowed values: `"file_path"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_index: integer(),
          file_path: %{required(:file_id) => String.t()},
          start_index: integer(),
          text: String.t(),
          type: :file_path
        }
  defstruct [:end_index, :file_path, :start_index, :text, :type]
end
