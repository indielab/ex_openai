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

  * `:preview_url` - **required** - `String.t() | nil`

  * `:type` - **required** - `ExOpenAI.Components.AttachmentType.t()`
    Attachment discriminator.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          mime_type: String.t(),
          name: String.t(),
          preview_url: String.t() | nil,
          type: ExOpenAI.Components.AttachmentType.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:id) => String.t(),
              required(:mime_type) => String.t(),
              required(:name) => String.t(),
              required(:preview_url) => String.t() | nil,
              required(:type) => ExOpenAI.Components.AttachmentType.input()
            }
  defstruct [:id, :mime_type, :name, :preview_url, :type]
end
