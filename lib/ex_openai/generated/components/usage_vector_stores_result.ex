defmodule ExOpenAI.Components.UsageVectorStoresResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated vector stores usage details of the specific time bucket.

  ## Fields

  * `:object` - **required** - `:"organization.usage.vector_stores.result"`
    Allowed values: `"organization.usage.vector_stores.result"`

  * `:project_id` - **optional** - `String.t() | nil`

  * `:usage_bytes` - **required** - `integer()`
    The vector stores usage in bytes.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          object: :"organization.usage.vector_stores.result",
          project_id: (String.t() | nil) | nil,
          usage_bytes: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:object) => :"organization.usage.vector_stores.result" | String.t(),
              optional(:project_id) => String.t() | nil,
              required(:usage_bytes) => integer()
            }
  defstruct [:object, :project_id, :usage_bytes]
end
