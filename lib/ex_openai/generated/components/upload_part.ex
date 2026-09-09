defmodule ExOpenAI.Components.UploadPart do
  use ExOpenAI.Jason

  @moduledoc """
  The upload Part represents a chunk of bytes we can add to an Upload object.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the Part was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The upload Part unique identifier, which can be referenced in API endpoints.

  * `:object` - **required** - `:"upload.part"`
    The object type, which is always `upload.part`.
    Allowed values: `"upload.part"`

  * `:upload_id` - **required** - `String.t()`
    The ID of the Upload object that this Part was added to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"upload.part",
          upload_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:object) => :"upload.part" | String.t(),
              required(:upload_id) => String.t()
            }
  defstruct [:created_at, :id, :object, :upload_id]
end
