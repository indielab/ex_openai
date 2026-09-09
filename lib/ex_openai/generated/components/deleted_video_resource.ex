defmodule ExOpenAI.Components.DeletedVideoResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting a video.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Indicates that the video resource was deleted.

  * `:id` - **required** - `String.t()`
    Identifier of the deleted video.

  * `:object` - **required** - `:"video.deleted"`
    The object type that signals the deletion response.
    Allowed values: `"video.deleted"`
    Default: `"video.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"video.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"video.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
