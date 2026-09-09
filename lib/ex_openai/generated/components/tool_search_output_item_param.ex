defmodule ExOpenAI.Components.ToolSearchOutputItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchOutputItemParam.

  ## Fields

  * `:call_id` - **optional** - `String.t() | nil`

  * `:execution` - **optional** - `ExOpenAI.Components.ToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **optional** - `String.t() | nil`

  * `:status` - **optional** - `ExOpenAI.Components.FunctionCallItemStatus.t() | nil`

  * `:tools` - **required** - `list(ExOpenAI.Components.Tool.t())`
    The loaded tool definitions returned by the tool search output.

  * `:type` - **required** - `:tool_search_output`
    The item type. Always `tool_search_output`.
    Allowed values: `"tool_search_output"`
    Default: `"tool_search_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          call_id: (String.t() | nil) | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t() | nil,
          id: (String.t() | nil) | nil,
          status: (ExOpenAI.Components.FunctionCallItemStatus.t() | nil) | nil,
          tools: list(ExOpenAI.Components.Tool.t()),
          type: :tool_search_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:call_id) => String.t() | nil,
              optional(:execution) => ExOpenAI.Components.ToolSearchExecutionType.input(),
              optional(:id) => String.t() | nil,
              optional(:status) => ExOpenAI.Components.FunctionCallItemStatus.input() | nil,
              required(:tools) => list(ExOpenAI.Components.Tool.input()),
              required(:type) => :tool_search_output | String.t()
            }
  defstruct [:call_id, :execution, :id, :status, :tools, :type]
end
