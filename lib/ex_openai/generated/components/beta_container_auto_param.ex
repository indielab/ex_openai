defmodule ExOpenAI.Components.BetaContainerAutoParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaContainerAutoParam.

  ## Fields

  * `:file_ids` - **optional** - `list(String.t())`
    An optional list of uploaded files to make available to your code.
    Constraints: maxItems: 50

  * `:memory_limit` - **optional** - `ExOpenAI.Components.BetaContainerMemoryLimit.t() | nil`

  * `:network_policy` - **optional** - `ExOpenAI.Components.BetaContainerNetworkPolicyDisabledParam.t() | ExOpenAI.Components.BetaContainerNetworkPolicyAllowlistParam.t()`
    Network access policy for the container.

  * `:skills` - **optional** - `list( ExOpenAI.Components.BetaSkillReferenceParam.t() | ExOpenAI.Components.BetaInlineSkillParam.t() )`
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
          memory_limit: (ExOpenAI.Components.BetaContainerMemoryLimit.t() | nil) | nil,
          network_policy:
            (ExOpenAI.Components.BetaContainerNetworkPolicyDisabledParam.t()
             | ExOpenAI.Components.BetaContainerNetworkPolicyAllowlistParam.t())
            | nil,
          skills:
            list(
              ExOpenAI.Components.BetaSkillReferenceParam.t()
              | ExOpenAI.Components.BetaInlineSkillParam.t()
            )
            | nil,
          type: :container_auto
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:file_ids) => list(String.t()),
              optional(:memory_limit) =>
                ExOpenAI.Components.BetaContainerMemoryLimit.input() | nil,
              optional(:network_policy) =>
                ExOpenAI.Components.BetaContainerNetworkPolicyDisabledParam.input()
                | ExOpenAI.Components.BetaContainerNetworkPolicyAllowlistParam.input(),
              optional(:skills) =>
                list(
                  ExOpenAI.Components.BetaSkillReferenceParam.input()
                  | ExOpenAI.Components.BetaInlineSkillParam.input()
                ),
              required(:type) => :container_auto | String.t()
            }
  defstruct [:file_ids, :memory_limit, :network_policy, :skills, :type]
end
