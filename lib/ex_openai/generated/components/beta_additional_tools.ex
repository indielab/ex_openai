defmodule ExOpenAI.Components.BetaAdditionalTools do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaAdditionalTools.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:id` - **required** - `String.t()`
    The unique ID of the additional tools item.

  * `:role` - **required** - `ExOpenAI.Components.BetaMessageRole.t()`
    The role that provided the additional tools.

  * `:tools` - **required** - `list(ExOpenAI.Components.BetaTool.t())`
    The additional tool definitions made available at this item.

  * `:type` - **required** - `:additional_tools`
    The type of the item. Always `additional_tools`.
    Allowed values: `"additional_tools"`
    Default: `"additional_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          id: String.t(),
          role: ExOpenAI.Components.BetaMessageRole.t(),
          tools: list(ExOpenAI.Components.BetaTool.t()),
          type: :additional_tools
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:id) => String.t(),
              required(:role) => ExOpenAI.Components.BetaMessageRole.input(),
              required(:tools) => list(ExOpenAI.Components.BetaTool.input()),
              required(:type) => :additional_tools | String.t()
            }
  defstruct [:agent, :id, :role, :tools, :type]
end
