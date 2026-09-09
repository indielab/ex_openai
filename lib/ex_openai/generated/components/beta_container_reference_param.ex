defmodule ExOpenAI.Components.BetaContainerReferenceParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaContainerReferenceParam.

  ## Fields

  * `:container_id` - **required** - `String.t()`
    The ID of the referenced container.

  * `:type` - **required** - `:container_reference`
    References a container created with the /v1/containers endpoint
    Allowed values: `"container_reference"`
    Default: `"container_reference"`
  """
  @type t() :: %{__struct__: __MODULE__, container_id: String.t(), type: :container_reference}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:container_id) => String.t(),
              required(:type) => :container_reference | String.t()
            }
  defstruct [:container_id, :type]
end
