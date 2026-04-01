defmodule ExOpenAI.Components.UpdateVectorStoreRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UpdateVectorStoreRequest.

  ## Fields

  * `:expires_after` - **optional** - `{:%{}, [], [{{:required, [], [:anchor]}, :last_active_at}, {{:required, [], [:days]}, {:integer, [], []}}]}`

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:name` - **optional** - `String.t() | nil`  
    The name of the vector store.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_after:
            %{required(:anchor) => :last_active_at, required(:days) => integer()} | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          name: String.t() | nil
        }
  defstruct [:expires_after, :metadata, :name]
end
