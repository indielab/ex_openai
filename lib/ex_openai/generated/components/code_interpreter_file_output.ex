defmodule ExOpenAI.Components.CodeInterpreterFileOutput do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a code interpreter tool call that is a file.


  ## Fields

  * `:files` - **required** - `[{:%{}, [], [{{:required, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:mime_type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`

  * `:type` - **required** - `:files`  
    The type of the code interpreter file output. Always `files`.  
    Allowed values: `"files"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          files: list(%{required(:file_id) => String.t(), required(:mime_type) => String.t()}),
          type: :files
        }
  defstruct [:files, :type]
end
