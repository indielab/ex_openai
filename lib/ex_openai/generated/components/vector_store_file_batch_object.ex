defmodule ExOpenAI.Components.VectorStoreFileBatchObject do
  use ExOpenAI.Jason

  @moduledoc """
  A batch of files attached to a vector store.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the vector store files batch was created.
    Format: `unixtime`

  * `:file_counts` - **required** - `%{ required(:cancelled) => integer(), required(:completed) => integer(), required(:failed) => integer(), required(:in_progress) => integer(), required(:total) => integer() }`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints.

  * `:object` - **required** - `:"vector_store.files_batch"`
    The object type, which is always `vector_store.file_batch`.
    Allowed values: `"vector_store.files_batch"`

  * `:status` - **required** - `:in_progress | :completed | :cancelled | :failed`
    The status of the vector store files batch, which can be either `in_progress`, `completed`, `cancelled` or `failed`.
    Allowed values: `"in_progress"`, `"completed"`, `"cancelled"`, `"failed"`

  * `:vector_store_id` - **required** - `String.t()`
    The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          file_counts: %{
            required(:cancelled) => integer(),
            required(:completed) => integer(),
            required(:failed) => integer(),
            required(:in_progress) => integer(),
            required(:total) => integer()
          },
          id: String.t(),
          object: :"vector_store.files_batch",
          status: ((:in_progress | :completed) | :cancelled) | :failed,
          vector_store_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:file_counts) => %{
                required(:cancelled) => integer(),
                required(:completed) => integer(),
                required(:failed) => integer(),
                required(:in_progress) => integer(),
                required(:total) => integer()
              },
              required(:id) => String.t(),
              required(:object) => :"vector_store.files_batch" | String.t(),
              required(:status) =>
                (((:in_progress | :completed) | :cancelled) | :failed) | String.t(),
              required(:vector_store_id) => String.t()
            }
  defstruct [:created_at, :file_counts, :id, :object, :status, :vector_store_id]
end
