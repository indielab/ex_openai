defmodule ExOpenAI.Components.ContainerFileCitationBody do
  use ExOpenAI.Jason

  @moduledoc """
  A citation for a container file used to generate a model response.

  ## Fields

  * `:container_id` - **required** - `String.t()`  
    The ID of the container file.

  * `:end_index` - **required** - `integer()`  
    The index of the last character of the container file citation in the message.

  * `:file_id` - **required** - `String.t()`  
    The ID of the file.

  * `:filename` - **required** - `String.t()`  
    The filename of the container file cited.

  * `:start_index` - **required** - `integer()`  
    The index of the first character of the container file citation in the message.

  * `:type` - **required** - `:container_file_citation`  
    The type of the container file citation. Always `container_file_citation`.  
    Allowed values: `"container_file_citation"`  
    Default: `"container_file_citation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          container_id: String.t(),
          end_index: integer(),
          file_id: String.t(),
          filename: String.t(),
          start_index: integer(),
          type: :container_file_citation
        }
  defstruct [:container_id, :end_index, :file_id, :filename, :start_index, :type]
end
