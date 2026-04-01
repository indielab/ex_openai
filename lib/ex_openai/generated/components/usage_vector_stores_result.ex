defmodule ExOpenAI.Components.UsageVectorStoresResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated vector stores usage details of the specific time bucket.

  ## Fields

  * `:object` - **required** - `:"organization.usage.vector_stores.result"`  
    Allowed values: `"organization.usage.vector_stores.result"`

  * `:project_id` - **optional** - `String.t() | any()`

  * `:usage_bytes` - **required** - `integer()`  
    The vector stores usage in bytes.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          object: :"organization.usage.vector_stores.result",
          project_id: (String.t() | any()) | nil,
          usage_bytes: integer()
        }
  defstruct [:object, :project_id, :usage_bytes]
end
