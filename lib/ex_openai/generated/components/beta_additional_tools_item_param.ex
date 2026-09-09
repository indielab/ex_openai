defmodule ExOpenAI.Components.BetaAdditionalToolsItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaAdditionalToolsItemParam.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:id` - **optional** - `String.t() | nil`

  * `:role` - **required** - `:developer`
    The role that provided the additional tools. Only `developer` is supported.
    Allowed values: `"developer"`
    Default: `"developer"`

  * `:tools` - **required** - `list(ExOpenAI.Components.BetaTool.t())`
    A list of additional tools made available at this item.

  * `:type` - **required** - `:additional_tools`
    The item type. Always `additional_tools`.
    Allowed values: `"additional_tools"`
    Default: `"additional_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          id: (String.t() | nil) | nil,
          role: :developer,
          tools: list(ExOpenAI.Components.BetaTool.t()),
          type: :additional_tools
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              optional(:id) => String.t() | nil,
              required(:role) => :developer | String.t(),
              required(:tools) => list(ExOpenAI.Components.BetaTool.input()),
              required(:type) => :additional_tools | String.t()
            }
  defstruct [:agent, :id, :role, :tools, :type]
end
