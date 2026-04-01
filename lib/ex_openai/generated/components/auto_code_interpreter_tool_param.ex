defmodule ExOpenAI.Components.AutoCodeInterpreterToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.

  ## Fields

  * `:file_ids` - **optional** - `[String.t()]`  
    An optional list of uploaded files to make available to your code.  
    Constraints: maxItems: 50

  * `:memory_limit` - **optional** - `ExOpenAI.Components.ContainerMemoryLimit.t() | any()`

  * `:network_policy` - **optional** - `ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t() | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t()`  
    Network access policy for the container.

  * `:type` - **required** - `:auto`  
    Always `auto`.  
    Allowed values: `"auto"`  
    Default: `"auto"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_ids: list(String.t()) | nil,
          memory_limit: (ExOpenAI.Components.ContainerMemoryLimit.t() | any()) | nil,
          network_policy:
            (ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t()
             | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t())
            | nil,
          type: :auto
        }
  defstruct [:file_ids, :memory_limit, :network_policy, :type]
end
