defmodule ExOpenAI.Components.ThreadResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a ChatKit thread and its current status.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) for when the thread was created.

  * `:id` - **required** - `String.t()`  
    Identifier of the thread.

  * `:object` - **required** - `:"chatkit.thread"`  
    Type discriminator that is always `chatkit.thread`.  
    Allowed values: `"chatkit.thread"`  
    Default: `"chatkit.thread"`

  * `:status` - **required** - `ExOpenAI.Components.ActiveStatus.t() | ExOpenAI.Components.LockedStatus.t() | ExOpenAI.Components.ClosedStatus.t()`  
    Current status for the thread. Defaults to `active` for newly created threads.

  * `:title` - **required** - `String.t() | any()`

  * `:user` - **required** - `String.t()`  
    Free-form string that identifies your end user who owns the thread.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"chatkit.thread",
          status:
            (ExOpenAI.Components.ActiveStatus.t() | ExOpenAI.Components.LockedStatus.t())
            | ExOpenAI.Components.ClosedStatus.t(),
          title: String.t() | any(),
          user: String.t()
        }
  defstruct [:created_at, :id, :object, :status, :title, :user]
end
