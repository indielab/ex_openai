defmodule ExOpenAI.Components.BetaFileCitationBody do
  use ExOpenAI.Jason

  @moduledoc """
  A citation to a file.

  ## Fields

  * `:file_id` - **required** - `String.t()`
    The ID of the file.

  * `:filename` - **required** - `String.t()`
    The filename of the file cited.

  * `:index` - **required** - `integer()`
    The index of the file in the list of files.

  * `:type` - **required** - `:file_citation`
    The type of the file citation. Always `file_citation`.
    Allowed values: `"file_citation"`
    Default: `"file_citation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_id: String.t(),
          filename: String.t(),
          index: integer(),
          type: :file_citation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:file_id) => String.t(),
              required(:filename) => String.t(),
              required(:index) => integer(),
              required(:type) => :file_citation | String.t()
            }
  defstruct [:file_id, :filename, :index, :type]
end
