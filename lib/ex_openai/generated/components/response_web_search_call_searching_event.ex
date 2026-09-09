defmodule ExOpenAI.Components.ResponseWebSearchCallSearchingEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a web search call is executing.

  ## Fields

  * `:item_id` - **required** - `String.t()`
    Unique ID for the output item associated with the web search call.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the web search call is associated with.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of the web search call being processed.

  * `:type` - **required** - `:"response.web_search_call.searching"`
    The type of the event. Always `response.web_search_call.searching`.
    Allowed values: `"response.web_search_call.searching"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.web_search_call.searching"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.web_search_call.searching" | String.t()
            }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
