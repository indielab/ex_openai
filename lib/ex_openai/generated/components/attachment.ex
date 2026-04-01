defmodule ExOpenAI.Components.Attachment do
  use ExOpenAI.Jason

  @moduledoc """
  Attachment metadata included on thread items.

  ## Fields

  * `:id` - **required** - `String.t()`  
    Identifier for the attachment.

  * `:mime_type` - **required** - `String.t()`  
    MIME type of the attachment.

  * `:name` - **required** - `String.t()`  
    Original display name for the attachment.

  * `:preview_url` - **required** - `String.t() | any()`

  * `:type` - **required** - `ExOpenAI.Components.AttachmentType.t()`  
    Attachment discriminator.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          mime_type: String.t(),
          name: String.t(),
          preview_url: String.t() | any(),
          type: ExOpenAI.Components.AttachmentType.t()
        }
  defstruct [:id, :mime_type, :name, :preview_url, :type]
end
