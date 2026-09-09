defmodule ExOpenAI.Components.ContainerAutoParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerAutoParam.

  ## Fields

  * `:file_ids` - **optional** - `list(String.t())`
    An optional list of uploaded files to make available to your code.
    Constraints: maxItems: 50

  * `:memory_limit` - **optional** - `ExOpenAI.Components.ContainerMemoryLimit.t() | nil`

  * `:network_policy` - **optional** - `ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t() | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t()`
    Network access policy for the container.

  * `:skills` - **optional** - `list(ExOpenAI.Components.SkillReferenceParam.t() | ExOpenAI.Components.InlineSkillParam.t())`
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
          memory_limit: (ExOpenAI.Components.ContainerMemoryLimit.t() | nil) | nil,
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:file_ids) => list(String.t()),
              optional(:memory_limit) => ExOpenAI.Components.ContainerMemoryLimit.input() | nil,
              optional(:network_policy) =>
                ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.input()
                | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.input(),
              optional(:skills) =>
                list(
                  ExOpenAI.Components.SkillReferenceParam.input()
                  | ExOpenAI.Components.InlineSkillParam.input()
                ),
              required(:type) => :container_auto | String.t()
            }
  defstruct [:file_ids, :memory_limit, :network_policy, :skills, :type]
end
