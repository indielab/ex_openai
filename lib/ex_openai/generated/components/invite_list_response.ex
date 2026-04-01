defmodule ExOpenAI.Components.InviteListResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema InviteListResponse.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.Invite.t()]`

  * `:first_id` - **optional** - `String.t()`  
    The first `invite_id` in the retrieved `list`

  * `:has_more` - **optional** - `boolean()`  
    The `has_more` property is used for pagination to indicate there are additional results.

  * `:last_id` - **optional** - `String.t()`  
    The last `invite_id` in the retrieved `list`

  * `:object` - **required** - `:list`  
    The object type, which is always `list`  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.Invite.t()),
          first_id: String.t() | nil,
          has_more: boolean() | nil,
          last_id: String.t() | nil,
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
