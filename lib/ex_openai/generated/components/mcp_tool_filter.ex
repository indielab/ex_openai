defmodule ExOpenAI.Components.MCPToolFilter do
  use ExOpenAI.Jason

  @moduledoc """
  A filter object to specify which tools are allowed.


  ## Fields

  * `:read_only` - **optional** - `boolean()`
    Indicates whether or not a tool modifies data or is read-only. If an
  MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
  it will match this filter.

  * `:tool_names` - **optional** - `list(String.t())`
    List of allowed tool names.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          read_only: boolean() | nil,
          tool_names: list(String.t()) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{optional(:read_only) => boolean(), optional(:tool_names) => list(String.t())}
  defstruct [:read_only, :tool_names]
end
