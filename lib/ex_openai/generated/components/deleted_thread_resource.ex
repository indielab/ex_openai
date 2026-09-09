defmodule ExOpenAI.Components.DeletedThreadResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting a thread.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Indicates that the thread has been deleted.

  * `:id` - **required** - `String.t()`
    Identifier of the deleted thread.

  * `:object` - **required** - `:"chatkit.thread.deleted"`
    Type discriminator that is always `chatkit.thread.deleted`.
    Allowed values: `"chatkit.thread.deleted"`
    Default: `"chatkit.thread.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"chatkit.thread.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"chatkit.thread.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
