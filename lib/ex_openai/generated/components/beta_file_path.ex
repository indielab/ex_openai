defmodule ExOpenAI.Components.BetaFilePath do
  use ExOpenAI.Jason

  @moduledoc """
  A path to a file.


  ## Fields

  * `:file_id` - **required** - `String.t()`
    The ID of the file.

  * `:index` - **required** - `integer()`
    The index of the file in the list of files.

  * `:type` - **required** - `:file_path`
    The type of the file path. Always `file_path`.
    Allowed values: `"file_path"`
  """
  @type t() :: %{__struct__: __MODULE__, file_id: String.t(), index: integer(), type: :file_path}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:file_id) => String.t(),
              required(:index) => integer(),
              required(:type) => :file_path | String.t()
            }
  defstruct [:file_id, :index, :type]
end
