defmodule ExOpenAI.Components.ResponseFileSearchCallSearchingEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a file search is currently searching.

  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The ID of the output item that the file search call is initiated.

  * `:output_index` - **required** - `integer()`  
    The index of the output item that the file search call is searching.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.file_search_call.searching"`  
    The type of the event. Always `response.file_search_call.searching`.  
    Allowed values: `"response.file_search_call.searching"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.file_search_call.searching"
        }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
