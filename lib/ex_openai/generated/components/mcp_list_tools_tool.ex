defmodule ExOpenAI.Components.MCPListToolsTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool available on an MCP server.


  ## Fields

  * `:annotations` - **optional** - `map() | nil`

  * `:description` - **optional** - `String.t() | nil`

  * `:input_schema` - **required** - `map()`
    The JSON schema describing the tool's input.

  * `:name` - **required** - `String.t()`
    The name of the tool.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          annotations: (map() | nil) | nil,
          description: (String.t() | nil) | nil,
          input_schema: map(),
          name: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:annotations) => map() | nil,
              optional(:description) => String.t() | nil,
              required(:input_schema) => map(),
              required(:name) => String.t()
            }
  defstruct [:annotations, :description, :input_schema, :name]
end
