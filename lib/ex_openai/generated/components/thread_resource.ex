defmodule ExOpenAI.Components.ThreadResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a ChatKit thread and its current status.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) for when the thread was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier of the thread.

  * `:object` - **required** - `:"chatkit.thread"`
    Type discriminator that is always `chatkit.thread`.
    Allowed values: `"chatkit.thread"`
    Default: `"chatkit.thread"`

  * `:status` - **required** - `ExOpenAI.Components.ActiveStatus.t() | ExOpenAI.Components.LockedStatus.t() | ExOpenAI.Components.ClosedStatus.t()`
    Current status for the thread. Defaults to `active` for newly created threads.

  * `:title` - **required** - `String.t() | nil`

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
          title: String.t() | nil,
          user: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:object) => :"chatkit.thread" | String.t(),
              required(:status) =>
                (ExOpenAI.Components.ActiveStatus.input()
                 | ExOpenAI.Components.LockedStatus.input())
                | ExOpenAI.Components.ClosedStatus.input(),
              required(:title) => String.t() | nil,
              required(:user) => String.t()
            }
  defstruct [:created_at, :id, :object, :status, :title, :user]
end
