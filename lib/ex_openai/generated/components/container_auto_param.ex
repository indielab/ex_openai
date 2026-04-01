defmodule ExOpenAI.Components.ContainerAutoParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerAutoParam.

  ## Fields

  * `:file_ids` - **optional** - `[String.t()]`  
    An optional list of uploaded files to make available to your code.  
    Constraints: maxItems: 50

  * `:memory_limit` - **optional** - `ExOpenAI.Components.ContainerMemoryLimit.t() | any()`

  * `:network_policy` - **optional** - `ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t() | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t()`  
    Network access policy for the container.

  * `:skills` - **optional** - `[ExOpenAI.Components.SkillReferenceParam.t() | ExOpenAI.Components.InlineSkillParam.t()]`  
    An optional list of skills referenced by id or inline data.  
    Constraints: maxItems: 200

  * `:type` - **required** - `:container_auto`  
    Automatically creates a container for this request  
    Allowed values: `"container_auto"`  
    Default: `"container_auto"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_ids: list(String.t()) | nil,
          memory_limit: (ExOpenAI.Components.ContainerMemoryLimit.t() | any()) | nil,
          network_policy:
            (ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t()
             | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t())
            | nil,
          skills:
            list(
              ExOpenAI.Components.SkillReferenceParam.t()
              | ExOpenAI.Components.InlineSkillParam.t()
            )
            | nil,
          type: :container_auto
        }
  defstruct [:file_ids, :memory_limit, :network_policy, :skills, :type]
end
