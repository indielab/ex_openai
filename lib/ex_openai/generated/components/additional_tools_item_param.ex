defmodule ExOpenAI.Components.AdditionalToolsItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AdditionalToolsItemParam.

  ## Fields

  * `:id` - **optional** - `String.t() | nil`

  * `:role` - **required** - `:developer`
    The role that provided the additional tools. Only `developer` is supported.
    Allowed values: `"developer"`
    Default: `"developer"`

  * `:tools` - **required** - `list(ExOpenAI.Components.Tool.t())`
    A list of additional tools made available at this item.

  * `:type` - **required** - `:additional_tools`
    The item type. Always `additional_tools`.
    Allowed values: `"additional_tools"`
    Default: `"additional_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: (String.t() | nil) | nil,
          role: :developer,
          tools: list(ExOpenAI.Components.Tool.t()),
          type: :additional_tools
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:id) => String.t() | nil,
              required(:role) => :developer | String.t(),
              required(:tools) => list(ExOpenAI.Components.Tool.input()),
              required(:type) => :additional_tools | String.t()
            }
  defstruct [:id, :role, :tools, :type]
end
