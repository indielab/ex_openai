defmodule ExOpenAI.Components.CreateFileRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateFileRequest.

  ## Fields

  * `:expires_after` - **optional** - `ExOpenAI.Components.FileExpirationAfter.t()`

  * `:file` - **required** - `binary()`  
    The File object (not file name) to be uploaded.  
    Format: `binary`

  * `:purpose` - **required** - `:assistants | :batch | :"fine-tune" | :vision | :user_data | :evals`  
    The intended purpose of the uploaded file. One of:
  - `assistants`: Used in the Assistants API
  - `batch`: Used in the Batch API
  - `fine-tune`: Used for fine-tuning
  - `vision`: Images used for vision fine-tuning
  - `user_data`: Flexible file type for any purpose
  - `evals`: Used for eval data sets  
    Allowed values: `"assistants"`, `"batch"`, `"fine-tune"`, `"vision"`, `"user_data"`, `"evals"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_after: ExOpenAI.Components.FileExpirationAfter.t() | nil,
          file: binary(),
          purpose: ((((:assistants | :batch) | :"fine-tune") | :vision) | :user_data) | :evals
        }
  defstruct [:expires_after, :file, :purpose]
end
