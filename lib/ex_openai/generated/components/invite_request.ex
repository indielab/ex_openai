defmodule ExOpenAI.Components.InviteRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema InviteRequest.

  ## Fields

  * `:email` - **required** - `String.t()`  
    Send an email to this address

  * `:projects` - **optional** - `[{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:role]}, {:|, [], [:member, :owner]}}]}]`  
    An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.

  * `:role` - **required** - `:reader | :owner`  
    `owner` or `reader`  
    Allowed values: `"reader"`, `"owner"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          email: String.t(),
          projects:
            list(%{required(:id) => String.t(), required(:role) => :member | :owner}) | nil,
          role: :reader | :owner
        }
  defstruct [:email, :projects, :role]
end
