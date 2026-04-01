defmodule ExOpenAI.Components.ImageRefParam do
  use ExOpenAI.Jason

  @moduledoc """
  Reference an input image by either URL or uploaded file ID.
  Provide exactly one of `image_url` or `file_id`.


  ## Fields

  * `:file_id` - **optional** - `String.t()`  
    The File API ID of an uploaded image to use as input.

  * `:image_url` - **optional** - `String.t()`  
    A fully qualified URL or base64-encoded data URL.  
    Constraints: maxLength: 20971520
  """
  @type t() :: %{__struct__: __MODULE__, file_id: String.t() | nil, image_url: String.t() | nil}
  defstruct [:file_id, :image_url]
end
