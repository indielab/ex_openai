defmodule ExOpenAI.Components.MessageDeltaContentTextAnnotationsFilePathObject do
  use ExOpenAI.Jason

  @moduledoc """
  A URL for the file that's generated when the assistant used the `code_interpreter` tool to generate a file.

  ## Fields

  * `:end_index` - **optional** - `integer()`  
    Constraints: minimum: 0

  * `:file_path` - **optional** - `{:%{}, [], [{{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:index` - **required** - `integer()`  
    The index of the annotation in the text content part.

  * `:start_index` - **optional** - `integer()`  
    Constraints: minimum: 0

  * `:text` - **optional** - `String.t()`  
    The text in the message content that needs to be replaced.

  * `:type` - **required** - `:file_path`  
    Always `file_path`.  
    Allowed values: `"file_path"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_index: integer() | nil,
          file_path: %{optional(:file_id) => String.t()} | nil,
          index: integer(),
          start_index: integer() | nil,
          text: String.t() | nil,
          type: :file_path
        }
  defstruct [:end_index, :file_path, :index, :start_index, :text, :type]
end
