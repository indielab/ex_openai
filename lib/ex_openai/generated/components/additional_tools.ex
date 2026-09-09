defmodule ExOpenAI.Components.AdditionalTools do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AdditionalTools.

  ## Fields

  * `:id` - **required** - `String.t()`
    The unique ID of the additional tools item.

  * `:role` - **required** - `ExOpenAI.Components.MessageRole.t()`
    The role that provided the additional tools.

  * `:tools` - **required** - `list(ExOpenAI.Components.Tool.t())`
    The additional tool definitions made available at this item.

  * `:type` - **required** - `:additional_tools`
    The type of the item. Always `additional_tools`.
    Allowed values: `"additional_tools"`
    Default: `"additional_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          role: ExOpenAI.Components.MessageRole.t(),
          tools: list(ExOpenAI.Components.Tool.t()),
          type: :additional_tools
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:id) => String.t(),
              required(:role) => ExOpenAI.Components.MessageRole.input(),
              required(:tools) => list(ExOpenAI.Components.Tool.input()),
              required(:type) => :additional_tools | String.t()
            }
  defstruct [:id, :role, :tools, :type]
end
