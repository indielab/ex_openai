defmodule ExOpenAI.Components.CreateUploadRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateUploadRequest.

  ## Fields

  * `:bytes` - **required** - `integer()`
    The number of bytes in the file you are uploading.

  * `:expires_after` - **optional** - `ExOpenAI.Components.FileExpirationAfter.t()`

  * `:filename` - **required** - `String.t()`
    The name of the file to upload.

  * `:mime_type` - **required** - `String.t()`
    The MIME type of the file.


  This must fall within the supported MIME types for your file purpose. See
  the supported MIME types for assistants and vision.

  * `:purpose` - **required** - `:assistants | :batch | :"fine-tune" | :vision`
    The intended purpose of the uploaded file.

  See the [documentation on File
  purposes](https://platform.openai.com/docs/api-reference/files/create#files-create-purpose).
    Allowed values: `"assistants"`, `"batch"`, `"fine-tune"`, `"vision"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: integer(),
          expires_after: ExOpenAI.Components.FileExpirationAfter.t() | nil,
          filename: String.t(),
          mime_type: String.t(),
          purpose: ((:assistants | :batch) | :"fine-tune") | :vision
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:bytes) => integer(),
              optional(:expires_after) => ExOpenAI.Components.FileExpirationAfter.input(),
              required(:filename) => String.t(),
              required(:mime_type) => String.t(),
              required(:purpose) =>
                (((:assistants | :batch) | :"fine-tune") | :vision) | String.t()
            }
  defstruct [:bytes, :expires_after, :filename, :mime_type, :purpose]
end
