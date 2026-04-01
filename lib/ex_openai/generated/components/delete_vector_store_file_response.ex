defmodule ExOpenAI.Components.DeleteVectorStoreFileResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteVectorStoreFileResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"vector_store.file.deleted"`  
    Allowed values: `"vector_store.file.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"vector_store.file.deleted"
        }
  defstruct [:deleted, :id, :object]
end
