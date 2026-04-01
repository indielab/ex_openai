defmodule ExOpenAI.Components.ContainerResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerResource.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the container was created.

  * `:expires_after` - **optional** - `{:%{}, [], [{{:optional, [], [:anchor]}, :last_active_at}, {{:optional, [], [:minutes]}, {:integer, [], []}}]}`  
    The container will expire after this time period.
  The anchor is the reference point for the expiration.
  The minutes is the number of minutes after the anchor before the container expires.

  * `:id` - **required** - `String.t()`  
    Unique identifier for the container.

  * `:last_active_at` - **optional** - `integer()`  
    Unix timestamp (in seconds) when the container was last active.

  * `:memory_limit` - **optional** - `:"1g" | :"4g" | :"16g" | :"64g"`  
    The memory limit configured for the container.  
    Allowed values: `"1g"`, `"4g"`, `"16g"`, `"64g"`

  * `:name` - **required** - `String.t()`  
    Name of the container.

  * `:network_policy` - **optional** - `{:%{}, [], [{{:optional, [], [:allowed_domains]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}, {{:required, [], [:type]}, {:|, [], [:allowlist, :disabled]}}]}`  
    Network access policy for the container.

  * `:object` - **required** - `String.t()`  
    The type of this object.

  * `:status` - **required** - `String.t()`  
    Status of the container (e.g., active, deleted).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          expires_after:
            %{optional(:anchor) => :last_active_at, optional(:minutes) => integer()} | nil,
          id: String.t(),
          last_active_at: integer() | nil,
          memory_limit: (((:"1g" | :"4g") | :"16g") | :"64g") | nil,
          name: String.t(),
          network_policy:
            %{
              optional(:allowed_domains) => list(String.t()),
              required(:type) => :allowlist | :disabled
            }
            | nil,
          object: String.t(),
          status: String.t()
        }
  defstruct [
    :created_at,
    :expires_after,
    :id,
    :last_active_at,
    :memory_limit,
    :name,
    :network_policy,
    :object,
    :status
  ]
end
