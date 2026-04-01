defmodule ExOpenAI.Components.MCPTool do
  use ExOpenAI.Jason

  @moduledoc """
  Give the model access to additional tools via remote Model Context Protocol
  (MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).


  ## Fields

  * `:allowed_tools` - **optional** - `[String.t()] | ExOpenAI.Components.MCPToolFilter.t() | any()`

  * `:authorization` - **optional** - `String.t()`  
    An OAuth access token that can be used with a remote MCP server, either
  with a custom MCP server URL or a service connector. Your application
  must handle the OAuth authorization flow and provide the token here.

  * `:connector_id` - **optional** - `:connector_dropbox | :connector_gmail | :connector_googlecalendar | :connector_googledrive | :connector_microsoftteams | :connector_outlookcalendar | :connector_outlookemail | :connector_sharepoint`  
    Identifier for service connectors, like those available in ChatGPT. One of
  `server_url` or `connector_id` must be provided. Learn more about service
  connectors [here](/docs/guides/tools-remote-mcp#connectors).

  Currently supported `connector_id` values are:

  - Dropbox: `connector_dropbox`
  - Gmail: `connector_gmail`
  - Google Calendar: `connector_googlecalendar`
  - Google Drive: `connector_googledrive`
  - Microsoft Teams: `connector_microsoftteams`
  - Outlook Calendar: `connector_outlookcalendar`
  - Outlook Email: `connector_outlookemail`
  - SharePoint: `connector_sharepoint`  
    Allowed values: `"connector_dropbox"`, `"connector_gmail"`, `"connector_googlecalendar"`, `"connector_googledrive"`, `"connector_microsoftteams"`, `"connector_outlookcalendar"`, `"connector_outlookemail"`, `"connector_sharepoint"`

  * `:defer_loading` - **optional** - `boolean()`  
    Whether this MCP tool is deferred and discovered via tool search.

  * `:headers` - **optional** - `map() | any()`

  * `:require_approval` - **optional** - `{:%{}, [], [{{:optional, [], [:always]}, {{:., [], [ExOpenAI.Components.MCPToolFilter, :t]}, [], []}}, {{:optional, [], [:never]}, {{:., [], [ExOpenAI.Components.MCPToolFilter, :t]}, [], []}}]} | :always | :never | any()`

  * `:server_description` - **optional** - `String.t()`  
    Optional description of the MCP server, used to provide more context.

  * `:server_label` - **required** - `String.t()`  
    A label for this MCP server, used to identify it in tool calls.

  * `:server_url` - **optional** - `String.t()`  
    The URL for the MCP server. One of `server_url` or `connector_id` must be
  provided.

  * `:type` - **required** - `:mcp`  
    The type of the MCP tool. Always `mcp`.  
    Allowed values: `"mcp"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_tools:
            ((list(String.t()) | ExOpenAI.Components.MCPToolFilter.t()) | any()) | nil,
          authorization: String.t() | nil,
          connector_id:
            (((((((:connector_dropbox | :connector_gmail) | :connector_googlecalendar)
                 | :connector_googledrive)
                | :connector_microsoftteams)
               | :connector_outlookcalendar)
              | :connector_outlookemail)
             | :connector_sharepoint)
            | nil,
          defer_loading: boolean() | nil,
          headers: (map() | any()) | nil,
          require_approval:
            ((%{
                optional(:always) => ExOpenAI.Components.MCPToolFilter.t(),
                optional(:never) => ExOpenAI.Components.MCPToolFilter.t()
              }
              | :always
              | :never)
             | any())
            | nil,
          server_description: String.t() | nil,
          server_label: String.t(),
          server_url: String.t() | nil,
          type: :mcp
        }
  defstruct [
    :allowed_tools,
    :authorization,
    :connector_id,
    :defer_loading,
    :headers,
    :require_approval,
    :server_description,
    :server_label,
    :server_url,
    :type
  ]
end
