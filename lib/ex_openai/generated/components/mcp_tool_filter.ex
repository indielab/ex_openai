defmodule ExOpenAI.Components.MCPToolFilter do
  use ExOpenAI.Jason

  @moduledoc """
  A filter object to specify which tools are allowed.


  ## Fields

  * `:read_only` - **optional** - `boolean()`  
    Indicates whether or not a tool modifies data or is read-only. If an
  MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
  it will match this filter.

  * `:tool_names` - **optional** - `[String.t()]`  
    List of allowed tool names.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          read_only: boolean() | nil,
          tool_names: list(String.t()) | nil
        }
  defstruct [:read_only, :tool_names]
end
