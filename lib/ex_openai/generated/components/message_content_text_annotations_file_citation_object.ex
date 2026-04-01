defmodule ExOpenAI.Components.MessageContentTextAnnotationsFileCitationObject do
  use ExOpenAI.Jason

  @moduledoc """
  A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file_search" tool to search files.

  ## Fields

  * `:end_index` - **required** - `integer()`  
    Constraints: minimum: 0

  * `:file_citation` - **required** - `{:%{}, [], [{{:required, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:start_index` - **required** - `integer()`  
    Constraints: minimum: 0

  * `:text` - **required** - `String.t()`  
    The text in the message content that needs to be replaced.

  * `:type` - **required** - `:file_citation`  
    Always `file_citation`.  
    Allowed values: `"file_citation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          end_index: integer(),
          file_citation: %{required(:file_id) => String.t()},
          start_index: integer(),
          text: String.t(),
          type: :file_citation
        }
  defstruct [:end_index, :file_citation, :start_index, :text, :type]
end
