defmodule ExOpenAI.Components.CompactResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CompactResource.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the compacted conversation was created.

  * `:id` - **required** - `String.t()`  
    The unique identifier for the compacted response.

  * `:object` - **required** - `:"response.compaction"`  
    The object type. Always `response.compaction`.  
    Allowed values: `"response.compaction"`  
    Default: `"response.compaction"`

  * `:output` - **required** - `[ExOpenAI.Components.ItemField.t()]`  
    The compacted list of output items.

  * `:usage` - **required** - `ExOpenAI.Components.ResponseUsage.t()`  
    Token accounting for the compaction pass, including cached, reasoning, and total tokens.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"response.compaction",
          output: list(ExOpenAI.Components.ItemField.t()),
          usage: ExOpenAI.Components.ResponseUsage.t()
        }
  defstruct [:created_at, :id, :object, :output, :usage]
end
