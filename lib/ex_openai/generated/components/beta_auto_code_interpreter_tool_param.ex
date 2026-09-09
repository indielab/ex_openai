defmodule ExOpenAI.Components.BetaAutoCodeInterpreterToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.

  ## Fields

  * `:file_ids` - **optional** - `list(String.t())`
    An optional list of uploaded files to make available to your code.
    Constraints: maxItems: 50

  * `:memory_limit` - **optional** - `ExOpenAI.Components.BetaContainerMemoryLimit.t() | nil`

  * `:network_policy` - **optional** - `ExOpenAI.Components.BetaContainerNetworkPolicyDisabledParam.t() | ExOpenAI.Components.BetaContainerNetworkPolicyAllowlistParam.t()`
    Network access policy for the container.

  * `:type` - **required** - `:auto`
    Always `auto`.
    Allowed values: `"auto"`
    Default: `"auto"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_ids: list(String.t()) | nil,
          memory_limit: (ExOpenAI.Components.BetaContainerMemoryLimit.t() | nil) | nil,
          network_policy:
            (ExOpenAI.Components.BetaContainerNetworkPolicyDisabledParam.t()
             | ExOpenAI.Components.BetaContainerNetworkPolicyAllowlistParam.t())
            | nil,
          type: :auto
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
              required(:type) => :auto | String.t()
            }
  defstruct [:file_ids, :memory_limit, :network_policy, :type]
end
