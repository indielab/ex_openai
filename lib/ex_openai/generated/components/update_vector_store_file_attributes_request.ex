defmodule ExOpenAI.Components.UpdateVectorStoreFileAttributesRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UpdateVectorStoreFileAttributesRequest.

  ## Fields

  * `:attributes` - **required** - `ExOpenAI.Components.VectorStoreFileAttributes.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          attributes: ExOpenAI.Components.VectorStoreFileAttributes.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:attributes) => ExOpenAI.Components.VectorStoreFileAttributes.input()}
  defstruct [:attributes]
end
