defmodule ExOpenAI.Components.CreateContainerBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateContainerBody.

  ## Fields

  * `:expires_after` - **optional** - `%{required(:anchor) => :last_active_at, required(:minutes) => integer()}`
    Container expiration time in seconds relative to the 'anchor' time.

  * `:file_ids` - **optional** - `list(String.t())`
    IDs of files to copy to the container.

  * `:memory_limit` - **optional** - `:"1g" | :"4g" | :"16g" | :"64g"`
    Optional memory limit for the container. Defaults to "1g".
    Allowed values: `"1g"`, `"4g"`, `"16g"`, `"64g"`

  * `:name` - **required** - `String.t()`
    Name of the container to create.

  * `:network_policy` - **optional** - `ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t() | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t()`
    Network access policy for the container.

  * `:skills` - **optional** - `list(ExOpenAI.Components.SkillReferenceParam.t() | ExOpenAI.Components.InlineSkillParam.t())`
    An optional list of skills referenced by id or inline data.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_after:
            %{required(:anchor) => :last_active_at, required(:minutes) => integer()} | nil,
          file_ids: list(String.t()) | nil,
          memory_limit: (((:"1g" | :"4g") | :"16g") | :"64g") | nil,
          name: String.t(),
          network_policy:
            (ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.t()
             | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.t())
            | nil,
          skills:
            list(
              ExOpenAI.Components.SkillReferenceParam.t()
              | ExOpenAI.Components.InlineSkillParam.t()
            )
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:expires_after) => %{
                required(:anchor) => :last_active_at | String.t(),
                required(:minutes) => integer()
              },
              optional(:file_ids) => list(String.t()),
              optional(:memory_limit) => (((:"1g" | :"4g") | :"16g") | :"64g") | String.t(),
              required(:name) => String.t(),
              optional(:network_policy) =>
                ExOpenAI.Components.ContainerNetworkPolicyDisabledParam.input()
                | ExOpenAI.Components.ContainerNetworkPolicyAllowlistParam.input(),
              optional(:skills) =>
                list(
                  ExOpenAI.Components.SkillReferenceParam.input()
                  | ExOpenAI.Components.InlineSkillParam.input()
                )
            }
  defstruct [:expires_after, :file_ids, :memory_limit, :name, :network_policy, :skills]
end
