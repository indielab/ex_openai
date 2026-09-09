defmodule ExOpenAI.Components.VectorStoreObject do
  use ExOpenAI.Jason

  @moduledoc """
  A vector store is a collection of processed files can be used by the `file_search` tool.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the vector store was created.
    Format: `unixtime`

  * `:expires_after` - **optional** - `ExOpenAI.Components.VectorStoreExpirationAfter.t()`

  * `:expires_at` - **optional** - `integer() | nil`

  * `:file_counts` - **required** - `%{ required(:cancelled) => integer(), required(:completed) => integer(), required(:failed) => integer(), required(:in_progress) => integer(), required(:total) => integer() }`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints.

  * `:last_active_at` - **required** - `integer() | nil`

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`

  * `:name` - **required** - `String.t()`
    The name of the vector store.

  * `:object` - **required** - `:vector_store`
    The object type, which is always `vector_store`.
    Allowed values: `"vector_store"`

  * `:status` - **required** - `:expired | :in_progress | :completed`
    The status of the vector store, which can be either `expired`, `in_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
    Allowed values: `"expired"`, `"in_progress"`, `"completed"`

  * `:usage_bytes` - **required** - `integer()`
    The total number of bytes used by the files in the vector store.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          expires_after: ExOpenAI.Components.VectorStoreExpirationAfter.t() | nil,
          expires_at: (integer() | nil) | nil,
          file_counts: %{
            required(:cancelled) => integer(),
            required(:completed) => integer(),
            required(:failed) => integer(),
            required(:in_progress) => integer(),
            required(:total) => integer()
          },
          id: String.t(),
          last_active_at: integer() | nil,
          metadata: ExOpenAI.Components.Metadata.t(),
          name: String.t(),
          object: :vector_store,
          status: (:expired | :in_progress) | :completed,
          usage_bytes: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              optional(:expires_after) => ExOpenAI.Components.VectorStoreExpirationAfter.input(),
              optional(:expires_at) => integer() | nil,
              required(:file_counts) => %{
                required(:cancelled) => integer(),
                required(:completed) => integer(),
                required(:failed) => integer(),
                required(:in_progress) => integer(),
                required(:total) => integer()
              },
              required(:id) => String.t(),
              required(:last_active_at) => integer() | nil,
              required(:metadata) => ExOpenAI.Components.Metadata.input(),
              required(:name) => String.t(),
              required(:object) => :vector_store | String.t(),
              required(:status) => ((:expired | :in_progress) | :completed) | String.t(),
              required(:usage_bytes) => integer()
            }
  defstruct [
    :created_at,
    :expires_after,
    :expires_at,
    :file_counts,
    :id,
    :last_active_at,
    :metadata,
    :name,
    :object,
    :status,
    :usage_bytes
  ]
end
