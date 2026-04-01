defmodule ExOpenAI.Components.InputMessage do
  use ExOpenAI.Jason

  @moduledoc """
  A message input to the model with a role indicating instruction following
  hierarchy. Instructions given with the `developer` or `system` role take
  precedence over instructions given with the `user` role.


  ## Fields

  * `:content` - **required** - `ExOpenAI.Components.InputMessageContentList.t()`

  * `:role` - **required** - `:user | :system | :developer`  
    The role of the message input. One of `user`, `system`, or `developer`.  
    Allowed values: `"user"`, `"system"`, `"developer"`

  * `:status` - **optional** - `:in_progress | :completed | :incomplete`  
    The status of item. One of `in_progress`, `completed`, or
  `incomplete`. Populated when items are returned via API.  
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`

  * `:type` - **optional** - `:message`  
    The type of the message input. Always set to `message`.  
    Allowed values: `"message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content: ExOpenAI.Components.InputMessageContentList.t(),
          role: (:user | :system) | :developer,
          status: ((:in_progress | :completed) | :incomplete) | nil,
          type: :message | nil
        }
  defstruct [:content, :role, :status, :type]
end
