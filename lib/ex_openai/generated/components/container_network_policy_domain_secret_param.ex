defmodule ExOpenAI.Components.ContainerNetworkPolicyDomainSecretParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerNetworkPolicyDomainSecretParam.

  ## Fields

  * `:domain` - **required** - `String.t()`  
    The domain associated with the secret.  
    Constraints: minLength: 1

  * `:name` - **required** - `String.t()`  
    The name of the secret to inject for the domain.  
    Constraints: minLength: 1

  * `:value` - **required** - `String.t()`  
    The secret value to inject for the domain.  
    Constraints: minLength: 1, maxLength: 10485760
  """
  @type t() :: %{__struct__: __MODULE__, domain: String.t(), name: String.t(), value: String.t()}
  defstruct [:domain, :name, :value]
end
