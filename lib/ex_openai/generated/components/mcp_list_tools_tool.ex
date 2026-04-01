defmodule ExOpenAI.Components.MCPListToolsTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool available on an MCP server.


  ## Fields

  * `:annotations` - **optional** - `map() | any()`

  * `:description` - **optional** - `String.t() | any()`

  * `:input_schema` - **required** - `map()`  
    The JSON schema describing the tool's input.

  * `:name` - **required** - `String.t()`  
    The name of the tool.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          annotations: (map() | any()) | nil,
          description: (String.t() | any()) | nil,
          input_schema: map(),
          name: String.t()
        }
  defstruct [:annotations, :description, :input_schema, :name]
end
