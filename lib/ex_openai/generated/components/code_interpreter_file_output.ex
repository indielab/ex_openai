defmodule ExOpenAI.Components.CodeInterpreterFileOutput do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a code interpreter tool call that is a file.


  ## Fields

  * `:files` - **required** - `list(%{required(:file_id) => String.t(), required(:mime_type) => String.t()})`

  * `:type` - **required** - `:files`
    The type of the code interpreter file output. Always `files`.
    Allowed values: `"files"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          files: list(%{required(:file_id) => String.t(), required(:mime_type) => String.t()}),
          type: :files
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:files) =>
                list(%{required(:file_id) => String.t(), required(:mime_type) => String.t()}),
              required(:type) => :files | String.t()
            }
  defstruct [:files, :type]
end
