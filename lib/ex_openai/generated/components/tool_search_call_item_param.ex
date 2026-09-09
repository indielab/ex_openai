defmodule ExOpenAI.Components.ToolSearchCallItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchCallItemParam.

  ## Fields

  * `:arguments` - **required** - `ExOpenAI.Components.EmptyModelParam.t()`
    The arguments supplied to the tool search call.

  * `:call_id` - **optional** - `String.t() | nil`

  * `:execution` - **optional** - `ExOpenAI.Components.ToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **optional** - `String.t() | nil`

  * `:status` - **optional** - `ExOpenAI.Components.FunctionCallItemStatus.t() | nil`

  * `:type` - **required** - `:tool_search_call`
    The item type. Always `tool_search_call`.
    Allowed values: `"tool_search_call"`
    Default: `"tool_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: ExOpenAI.Components.EmptyModelParam.t(),
          call_id: (String.t() | nil) | nil,
          execution: ExOpenAI.Components.ToolSearchExecutionType.t() | nil,
          id: (String.t() | nil) | nil,
          status: (ExOpenAI.Components.FunctionCallItemStatus.t() | nil) | nil,
          type: :tool_search_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:arguments) => ExOpenAI.Components.EmptyModelParam.input(),
              optional(:call_id) => String.t() | nil,
              optional(:execution) => ExOpenAI.Components.ToolSearchExecutionType.input(),
              optional(:id) => String.t() | nil,
              optional(:status) => ExOpenAI.Components.FunctionCallItemStatus.input() | nil,
              required(:type) => :tool_search_call | String.t()
            }
  defstruct [:arguments, :call_id, :execution, :id, :status, :type]
end
