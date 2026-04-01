defmodule ExOpenAI.Components.VectorStoreFileContentResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Represents the parsed content of a vector store file.

  ## Fields

  * `:data` - **required** - `[{:%{}, [], [{{:optional, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    Parsed content of the file.

  * `:has_more` - **required** - `boolean()`  
    Indicates if there are more content pages to fetch.

  * `:next_page` - **required** - `String.t() | any()`

  * `:object` - **required** - `:"vector_store.file_content.page"`  
    The object type, which is always `vector_store.file_content.page`  
    Allowed values: `"vector_store.file_content.page"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(%{optional(:text) => String.t(), optional(:type) => String.t()}),
          has_more: boolean(),
          next_page: String.t() | any(),
          object: :"vector_store.file_content.page"
        }
  defstruct [:data, :has_more, :next_page, :object]
end
