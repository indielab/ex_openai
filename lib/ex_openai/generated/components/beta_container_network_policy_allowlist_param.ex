defmodule ExOpenAI.Components.BetaContainerNetworkPolicyAllowlistParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaContainerNetworkPolicyAllowlistParam.

  ## Fields

  * `:allowed_domains` - **required** - `list(String.t())`
    A list of allowed domains when type is `allowlist`.
    Constraints: minItems: 1

  * `:domain_secrets` - **optional** - `list(ExOpenAI.Components.BetaContainerNetworkPolicyDomainSecretParam.t())`
    Optional domain-scoped secrets for allowlisted domains.
    Constraints: minItems: 1

  * `:type` - **required** - `:allowlist`
    Allow outbound network access only to specified domains. Always `allowlist`.
    Allowed values: `"allowlist"`
    Default: `"allowlist"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_domains: list(String.t()),
          domain_secrets:
            list(ExOpenAI.Components.BetaContainerNetworkPolicyDomainSecretParam.t()) | nil,
          type: :allowlist
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:allowed_domains) => list(String.t()),
              optional(:domain_secrets) =>
                list(ExOpenAI.Components.BetaContainerNetworkPolicyDomainSecretParam.input()),
              required(:type) => :allowlist | String.t()
            }
  defstruct [:allowed_domains, :domain_secrets, :type]
end
