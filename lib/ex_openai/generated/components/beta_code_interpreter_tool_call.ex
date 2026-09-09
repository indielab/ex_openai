defmodule ExOpenAI.Components.BetaCodeInterpreterToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  A tool call to run code.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:code` - **required** - `String.t() | nil`

  * `:container_id` - **required** - `String.t()`
    The ID of the container used to run the code.

  * `:id` - **required** - `String.t()`
    The unique ID of the code interpreter tool call.

  * `:outputs` - **required** - `list( ExOpenAI.Components.BetaCodeInterpreterOutputLogs.t() | ExOpenAI.Components.BetaCodeInterpreterOutputImage.t() ) | nil`

  * `:status` - **required** - `:in_progress | :completed | :incomplete | :interpreting | :failed`
    The status of the code interpreter tool call. Valid values are `in_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`, `"interpreting"`, `"failed"`

  * `:type` - **required** - `:code_interpreter_call`
    The type of the code interpreter tool call. Always `code_interpreter_call`.
    Allowed values: `"code_interpreter_call"`
    Default: `"code_interpreter_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          code: String.t() | nil,
          container_id: String.t(),
          id: String.t(),
          outputs:
            list(
              ExOpenAI.Components.BetaCodeInterpreterOutputLogs.t()
              | ExOpenAI.Components.BetaCodeInterpreterOutputImage.t()
            )
            | nil,
          status: (((:in_progress | :completed) | :incomplete) | :interpreting) | :failed,
          type: :code_interpreter_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:code) => String.t() | nil,
              required(:container_id) => String.t(),
              required(:id) => String.t(),
              required(:outputs) =>
                list(
                  ExOpenAI.Components.BetaCodeInterpreterOutputLogs.input()
                  | ExOpenAI.Components.BetaCodeInterpreterOutputImage.input()
                )
                | nil,
              required(:status) =>
                ((((:in_progress | :completed) | :incomplete) | :interpreting) | :failed)
                | String.t(),
              required(:type) => :code_interpreter_call | String.t()
            }
  defstruct [:agent, :code, :container_id, :id, :outputs, :status, :type]
end
