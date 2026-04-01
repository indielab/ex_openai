defmodule ExOpenAI.Components.VectorStoreSearchResultItem do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VectorStoreSearchResultItem.

  ## Fields

  * `:attributes` - **required** - `ExOpenAI.Components.VectorStoreFileAttributes.t()`

  * `:content` - **required** - `[ExOpenAI.Components.VectorStoreSearchResultContentObject.t()]`  
    Content chunks from the file.

  * `:file_id` - **required** - `String.t()`  
    The ID of the vector store file.

  * `:filename` - **required** - `String.t()`  
    The name of the vector store file.

  * `:score` - **required** - `number()`  
    The similarity score for the result.  
    Constraints: minimum: 0, maximum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          attributes: ExOpenAI.Components.VectorStoreFileAttributes.t(),
          content: list(ExOpenAI.Components.VectorStoreSearchResultContentObject.t()),
          file_id: String.t(),
          filename: String.t(),
          score: number()
        }
  defstruct [:attributes, :content, :file_id, :filename, :score]
end
