defmodule ExOpenAI.Components.ToolSearchOutput do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchOutput.

  ## Fields

  * `:call_id` - **required** - `String.t() | nil`

  * `:created_by` - **optional** - `String.t()`
    The identifier of the actor that created the item.

  * `:execution` - **required** - `ExOpenAI.Components.ToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **required** - `String.t()`
    The unique ID of the tool search output item.

  * `:status` - **required** - `ExOpenAI.Components.FunctionCallOutputStatusEnum.t()`
    The status of the tool search output item that was recorded.

  * `:tools` - **required** - `list(ExOpenAI.Components.Tool.t())`
    The loaded tool definitions returned by tool search.

  * `:type` - **required** - `:tool_search_output`
    The type of the item. Always `tool_search_output`.
    Allowed values: `"tool_search_output"`
    Default: `"tool_search_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          call_id: String.t() | nil,
          created_by: String.t() | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t(),
          id: String.t(),
          status: ExOpenAI.Components.FunctionCallOutputStatusEnum.t(),
          tools: list(ExOpenAI.Components.Tool.t()),
          type: :tool_search_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:call_id) => String.t() | nil,
              optional(:created_by) => String.t(),
              required(:execution) => ExOpenAI.Components.ToolSearchExecutionType.input(),
              required(:id) => String.t(),
              required(:status) => ExOpenAI.Components.FunctionCallOutputStatusEnum.input(),
              required(:tools) => list(ExOpenAI.Components.Tool.input()),
              required(:type) => :tool_search_output | String.t()
            }
  defstruct [:call_id, :created_by, :execution, :id, :status, :tools, :type]
end
