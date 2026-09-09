defmodule ExOpenAI.Components.ProjectHostedToolPermissionsUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectHostedToolPermissionsUpdateRequest.

  ## Fields

  * `:code_interpreter` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil`
    The code interpreter permission update.

  * `:file_search` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil`
    The file search permission update.

  * `:image_generation` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil`
    The image generation permission update.

  * `:mcp` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil`
    The MCP permission update.

  * `:web_search` - **optional** - `ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil`
    The web search permission update.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code_interpreter: (ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil) | nil,
          file_search: (ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil) | nil,
          image_generation: (ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil) | nil,
          mcp: (ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil) | nil,
          web_search: (ExOpenAI.Components.HostedToolPermissionUpdate.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:code_interpreter) =>
                ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil,
              optional(:file_search) =>
                ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil,
              optional(:image_generation) =>
                ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil,
              optional(:mcp) => ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil,
              optional(:web_search) =>
                ExOpenAI.Components.HostedToolPermissionUpdate.input() | nil
            }
  defstruct [:code_interpreter, :file_search, :image_generation, :mcp, :web_search]
end
