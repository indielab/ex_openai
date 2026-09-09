defmodule ExOpenAI.Components.VectorStoreFileContentResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Represents the parsed content of a vector store file.

  ## Fields

  * `:data` - **required** - `list(%{optional(:text) => String.t(), optional(:type) => String.t()})`
    Parsed content of the file.

  * `:has_more` - **required** - `boolean()`
    Indicates if there are more content pages to fetch.

  * `:next_page` - **required** - `String.t() | nil`

  * `:object` - **required** - `:"vector_store.file_content.page"`
    The object type, which is always `vector_store.file_content.page`
    Allowed values: `"vector_store.file_content.page"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(%{optional(:text) => String.t(), optional(:type) => String.t()}),
          has_more: boolean(),
          next_page: String.t() | nil,
          object: :"vector_store.file_content.page"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) =>
                list(%{optional(:text) => String.t(), optional(:type) => String.t()}),
              required(:has_more) => boolean(),
              required(:next_page) => String.t() | nil,
              required(:object) => :"vector_store.file_content.page" | String.t()
            }
  defstruct [:data, :has_more, :next_page, :object]
end
