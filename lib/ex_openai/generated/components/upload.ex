defmodule ExOpenAI.Components.Upload do
  use ExOpenAI.Jason

  @moduledoc """
  The Upload object can accept byte chunks in the form of Parts.


  ## Fields

  * `:bytes` - **required** - `integer()`  
    The intended number of bytes to be uploaded.

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the Upload was created.

  * `:expires_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the Upload will expire.

  * `:file` - **optional** - `{:%{}, [], [{{:required, [], [:bytes]}, {:integer, [], []}}, {{:required, [], [:created_at]}, {:integer, [], []}}, {{:optional, [], [:expires_at]}, {:integer, [], []}}, {{:required, [], [:filename]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:object]}, :file}, {{:required, [], [:purpose]}, {:|, [], [{:|, [], [{:|, [], [{:|, [], [{:|, [], [{:|, [], [{:|, [], [:assistants, :assistants_output]}, :batch]}, :batch_output]}, :"fine-tune"]}, :"fine-tune-results"]}, :vision]}, :user_data]}}, {{:required, [], [:status]}, {:|, [], [{:|, [], [:uploaded, :processed]}, :error]}}, {{:optional, [], [:status_details]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:filename` - **required** - `String.t()`  
    The name of the file to be uploaded.

  * `:id` - **required** - `String.t()`  
    The Upload unique identifier, which can be referenced in API endpoints.

  * `:object` - **optional** - `:upload`  
    The object type, which is always "upload".  
    Allowed values: `"upload"`

  * `:purpose` - **required** - `String.t()`  
    The intended purpose of the file. [Please refer here](/docs/api-reference/files/object#files/object-purpose) for acceptable values.

  * `:status` - **required** - `:pending | :completed | :cancelled | :expired`  
    The status of the Upload.  
    Allowed values: `"pending"`, `"completed"`, `"cancelled"`, `"expired"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: integer(),
          created_at: integer(),
          expires_at: integer(),
          file:
            %{
              required(:bytes) => integer(),
              required(:created_at) => integer(),
              optional(:expires_at) => integer(),
              required(:filename) => String.t(),
              required(:id) => String.t(),
              required(:object) => :file,
              required(:purpose) =>
                ((((((:assistants | :assistants_output) | :batch) | :batch_output) | :"fine-tune")
                  | :"fine-tune-results")
                 | :vision)
                | :user_data,
              required(:status) => (:uploaded | :processed) | :error,
              optional(:status_details) => String.t()
            }
            | nil,
          filename: String.t(),
          id: String.t(),
          object: :upload | nil,
          purpose: String.t(),
          status: ((:pending | :completed) | :cancelled) | :expired
        }
  defstruct [:bytes, :created_at, :expires_at, :file, :filename, :id, :object, :purpose, :status]
end
