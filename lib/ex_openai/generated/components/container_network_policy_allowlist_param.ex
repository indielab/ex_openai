defmodule ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerNetworkPolicyAllowlistParam.

  ## Fields

  * `:allowed_domains` - **required** - `[String.t()]`  
    A list of allowed domains when type is `allowlist`.  
    Constraints: minItems: 1

  * `:domain_secrets` - **optional** - `[ExOpenAI.Components.ContainerNetworkPolicyDomainSecretParam.t()]`  
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
            list(ExOpenAI.Components.ContainerNetworkPolicyDomainSecretParam.t()) | nil,
          type: :allowlist
        }
  defstruct [:allowed_domains, :domain_secrets, :type]
end
