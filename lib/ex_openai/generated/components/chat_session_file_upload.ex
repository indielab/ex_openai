defmodule ExOpenAI.Components.ChatSessionFileUpload do
  use ExOpenAI.Jason

  @moduledoc """
  Upload permissions and limits applied to the session.

  ## Fields

  * `:enabled` - **required** - `boolean()`  
    Indicates if uploads are enabled for the session.

  * `:max_file_size` - **required** - `integer() | any()`

  * `:max_files` - **required** - `integer() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          enabled: boolean(),
          max_file_size: integer() | any(),
          max_files: integer() | any()
        }
  defstruct [:enabled, :max_file_size, :max_files]
end
