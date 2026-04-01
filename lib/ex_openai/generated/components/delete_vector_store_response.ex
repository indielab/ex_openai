defmodule ExOpenAI.Components.DeleteVectorStoreResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema DeleteVectorStoreResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"vector_store.deleted"`  
    Allowed values: `"vector_store.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"vector_store.deleted"
        }
  defstruct [:deleted, :id, :object]
end
