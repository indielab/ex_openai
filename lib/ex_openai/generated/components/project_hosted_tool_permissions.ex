defmodule ExOpenAI.Components.ProjectHostedToolPermissions do
  use ExOpenAI.Jason

  @moduledoc """
  Represents hosted tool permissions for a project.

  ## Fields

  * `:code_interpreter` - **required** - `ExOpenAI.Components.HostedToolPermission.t()`

  * `:file_search` - **required** - `ExOpenAI.Components.HostedToolPermission.t()`

  * `:image_generation` - **required** - `ExOpenAI.Components.HostedToolPermission.t()`

  * `:mcp` - **required** - `ExOpenAI.Components.HostedToolPermission.t()`

  * `:web_search` - **required** - `ExOpenAI.Components.HostedToolPermission.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code_interpreter: ExOpenAI.Components.HostedToolPermission.t(),
          file_search: ExOpenAI.Components.HostedToolPermission.t(),
          image_generation: ExOpenAI.Components.HostedToolPermission.t(),
          mcp: ExOpenAI.Components.HostedToolPermission.t(),
          web_search: ExOpenAI.Components.HostedToolPermission.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code_interpreter) => ExOpenAI.Components.HostedToolPermission.input(),
              required(:file_search) => ExOpenAI.Components.HostedToolPermission.input(),
              required(:image_generation) => ExOpenAI.Components.HostedToolPermission.input(),
              required(:mcp) => ExOpenAI.Components.HostedToolPermission.input(),
              required(:web_search) => ExOpenAI.Components.HostedToolPermission.input()
            }
  defstruct [:code_interpreter, :file_search, :image_generation, :mcp, :web_search]
end
