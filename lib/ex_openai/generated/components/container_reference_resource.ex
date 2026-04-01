defmodule ExOpenAI.Components.ContainerReferenceResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a container created with /v1/containers.

  ## Fields

  * `:container_id` - **required** - `String.t()`

  * `:type` - **required** - `:container_reference`  
    The environment type. Always `container_reference`.  
    Allowed values: `"container_reference"`  
    Default: `"container_reference"`
  """
  @type t() :: %{__struct__: __MODULE__, container_id: String.t(), type: :container_reference}
  defstruct [:container_id, :type]
end
