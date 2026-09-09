defmodule ExOpenAI.Components.ChatSessionFileUpload do
  use ExOpenAI.Jason

  @moduledoc """
  Upload permissions and limits applied to the session.

  ## Fields

  * `:enabled` - **required** - `boolean()`
    Indicates if uploads are enabled for the session.

  * `:max_file_size` - **required** - `integer() | nil`

  * `:max_files` - **required** - `integer() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          enabled: boolean(),
          max_file_size: integer() | nil,
          max_files: integer() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:enabled) => boolean(),
              required(:max_file_size) => integer() | nil,
              required(:max_files) => integer() | nil
            }
  defstruct [:enabled, :max_file_size, :max_files]
end
