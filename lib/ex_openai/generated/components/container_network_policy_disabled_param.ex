defmodule ExOpenAI.Components.ContainerNetworkPolicyDisabledParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerNetworkPolicyDisabledParam.

  ## Fields

  * `:type` - **required** - `:disabled`  
    Disable outbound network access. Always `disabled`.  
    Allowed values: `"disabled"`  
    Default: `"disabled"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :disabled}
  defstruct [:type]
end
