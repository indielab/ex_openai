defmodule ExOpenAI.Components.VectorStoreFileObject do
  use ExOpenAI.Jason

  @moduledoc """
  A list of files attached to a vector store.

  ## Fields

  * `:attributes` - **optional** - `ExOpenAI.Components.VectorStoreFileAttributes.t()`

  * `:chunking_strategy` - **optional** - `map()`
    The strategy used to chunk the file.

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the vector store file was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints.

  * `:last_error` - **required** - `%{ required(:code) => :server_error | :unsupported_file | :invalid_file, required(:message) => String.t() } | nil`

  * `:object` - **required** - `:"vector_store.file"`
    The object type, which is always `vector_store.file`.
    Allowed values: `"vector_store.file"`

  * `:status` - **required** - `:in_progress | :completed | :cancelled | :failed`
    The status of the vector store file, which can be either `in_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
    Allowed values: `"in_progress"`, `"completed"`, `"cancelled"`, `"failed"`

  * `:usage_bytes` - **required** - `integer()`
    The total vector store usage in bytes. Note that this may be different from the original file size.

  * `:vector_store_id` - **required** - `String.t()`
    The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          attributes: ExOpenAI.Components.VectorStoreFileAttributes.t() | nil,
          chunking_strategy: map() | nil,
          created_at: integer(),
          id: String.t(),
          last_error:
            %{
              required(:code) => (:server_error | :unsupported_file) | :invalid_file,
              required(:message) => String.t()
            }
            | nil,
          object: :"vector_store.file",
          status: ((:in_progress | :completed) | :cancelled) | :failed,
          usage_bytes: integer(),
          vector_store_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:attributes) => ExOpenAI.Components.VectorStoreFileAttributes.input(),
              optional(:chunking_strategy) =>
                ExOpenAI.Components.StaticChunkingStrategyResponseParam.input()
                | ExOpenAI.Components.OtherChunkingStrategyResponseParam.input(),
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:last_error) =>
                %{
                  required(:code) =>
                    ((:server_error | :unsupported_file) | :invalid_file) | String.t(),
                  required(:message) => String.t()
                }
                | nil,
              required(:object) => :"vector_store.file" | String.t(),
              required(:status) =>
                (((:in_progress | :completed) | :cancelled) | :failed) | String.t(),
              required(:usage_bytes) => integer(),
              required(:vector_store_id) => String.t()
            }
  defstruct [
    :attributes,
    :chunking_strategy,
    :created_at,
    :id,
    :last_error,
    :object,
    :status,
    :usage_bytes,
    :vector_store_id
  ]
end
