defmodule ExOpenAI.Components.CreateVectorStoreFileBatchRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateVectorStoreFileBatchRequest.

  ## Fields

  * `:attributes` - **optional** - `ExOpenAI.Components.VectorStoreFileAttributes.t()`

  * `:chunking_strategy` - **optional** - `ExOpenAI.Components.ChunkingStrategyRequestParam.t()`

  * `:file_ids` - **optional** - `[String.t()]`  
    A list of [File](/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file_search` that can access files.  If `attributes` or `chunking_strategy` are provided, they will be  applied to all files in the batch. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `files`.  
    Constraints: minItems: 1, maxItems: 2000

  * `:files` - **optional** - `[ExOpenAI.Components.CreateVectorStoreFileRequest.t()]`  
    A list of objects that each include a `file_id` plus optional `attributes` or `chunking_strategy`. Use this when you need to override metadata for specific files. The global `attributes` or `chunking_strategy` will be ignored and must be specified for each file. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `file_ids`.  
    Constraints: minItems: 1, maxItems: 2000
  """
  @type t() :: %{
          __struct__: __MODULE__,
          attributes: ExOpenAI.Components.VectorStoreFileAttributes.t() | nil,
          chunking_strategy: ExOpenAI.Components.ChunkingStrategyRequestParam.t() | nil,
          file_ids: list(String.t()) | nil,
          files: list(ExOpenAI.Components.CreateVectorStoreFileRequest.t()) | nil
        }
  defstruct [:attributes, :chunking_strategy, :file_ids, :files]
end
