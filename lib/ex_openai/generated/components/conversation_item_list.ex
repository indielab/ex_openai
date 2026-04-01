defmodule ExOpenAI.Components.ConversationItemList do
  use ExOpenAI.Jason

  @moduledoc """
  A list of Conversation items.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.ConversationItem.t()]`  
    A list of conversation items.

  * `:first_id` - **required** - `String.t()`  
    The ID of the first item in the list.

  * `:has_more` - **required** - `boolean()`  
    Whether there are more items available.

  * `:last_id` - **required** - `String.t()`  
    The ID of the last item in the list.

  * `:object` - **required** - `:list`  
    The type of object returned, must be `list`.  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.ConversationItem.t()),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
