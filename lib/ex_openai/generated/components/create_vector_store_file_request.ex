defmodule ExOpenAI.Components.CreateVectorStoreFileRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateVectorStoreFileRequest.

  ## Fields

  * `:attributes` - **optional** - `ExOpenAI.Components.VectorStoreFileAttributes.t()`

  * `:chunking_strategy` - **optional** - `ExOpenAI.Components.ChunkingStrategyRequestParam.t()`

  * `:file_id` - **required** - `String.t()`  
    A [File](/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file_search` that can access files. For multi-file ingestion, we recommend [`file_batches`](/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          attributes: ExOpenAI.Components.VectorStoreFileAttributes.t() | nil,
          chunking_strategy: ExOpenAI.Components.ChunkingStrategyRequestParam.t() | nil,
          file_id: String.t()
        }
  defstruct [:attributes, :chunking_strategy, :file_id]
end
