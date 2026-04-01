defmodule ExOpenAI.Components.CreateVectorStoreRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateVectorStoreRequest.

  ## Fields

  * `:chunking_strategy` - **optional** - `map()`  
    The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file_ids` is non-empty.

  * `:description` - **optional** - `String.t()`  
    A description for the vector store. Can be used to describe the vector store's purpose.

  * `:expires_after` - **optional** - `ExOpenAI.Components.VectorStoreExpirationAfter.t()`

  * `:file_ids` - **optional** - `[String.t()]`  
    A list of [File](/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file_search` that can access files.  
    Constraints: maxItems: 500

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:name` - **optional** - `String.t()`  
    The name of the vector store.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          chunking_strategy: map() | nil,
          description: String.t() | nil,
          expires_after: ExOpenAI.Components.VectorStoreExpirationAfter.t() | nil,
          file_ids: list(String.t()) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          name: String.t() | nil
        }
  defstruct [:chunking_strategy, :description, :expires_after, :file_ids, :metadata, :name]
end
