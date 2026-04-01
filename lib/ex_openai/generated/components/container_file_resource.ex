defmodule ExOpenAI.Components.ContainerFileResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerFileResource.

  ## Fields

  * `:bytes` - **required** - `integer()`  
    Size of the file in bytes.

  * `:container_id` - **required** - `String.t()`  
    The container this file belongs to.

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the file was created.

  * `:id` - **required** - `String.t()`  
    Unique identifier for the file.

  * `:object` - **required** - `String.t()`  
    The type of this object (`container.file`).

  * `:path` - **required** - `String.t()`  
    Path of the file in the container.

  * `:source` - **required** - `String.t()`  
    Source of the file (e.g., `user`, `assistant`).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          bytes: integer(),
          container_id: String.t(),
          created_at: integer(),
          id: String.t(),
          object: String.t(),
          path: String.t(),
          source: String.t()
        }
  defstruct [:bytes, :container_id, :created_at, :id, :object, :path, :source]
end
