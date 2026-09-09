defmodule ExOpenAI.Components.ComputerToolCallOutputResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ComputerToolCallOutputResource.

  ## Fields

  * `:acknowledged_safety_checks` - **optional** - `list(ExOpenAI.Components.ComputerCallSafetyCheckParam.t())`
    The safety checks reported by the API that have been acknowledged by the
  developer.

  * `:call_id` - **required** - `String.t()`
    The ID of the computer tool call that produced the output.

  * `:created_by` - **optional** - `String.t()`
    The identifier of the actor that created the item.

  * `:id` - **required** - `String.t()`
    The unique ID of the computer call tool output.

  * `:output` - **required** - `ExOpenAI.Components.ComputerScreenshotImage.t()`

  * `:status` - **required** - `ExOpenAI.Components.ComputerCallOutputStatus.t()`
    The status of the message input. One of `in_progress`, `completed`, or
  `incomplete`. Populated when input items are returned via API.

  * `:type` - **required** - `:computer_call_output`
    The type of the computer tool call output. Always `computer_call_output`.
    Allowed values: `"computer_call_output"`
    Default: `"computer_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          acknowledged_safety_checks:
            list(ExOpenAI.Components.ComputerCallSafetyCheckParam.t()) | nil,
          call_id: String.t(),
          created_by: String.t() | nil,
          id: String.t(),
          output: ExOpenAI.Components.ComputerScreenshotImage.t(),
          status: ExOpenAI.Components.ComputerCallOutputStatus.t(),
          type: :computer_call_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:acknowledged_safety_checks) =>
                list(ExOpenAI.Components.ComputerCallSafetyCheckParam.input()),
              required(:call_id) => String.t(),
              optional(:created_by) => String.t(),
              required(:id) => String.t(),
              required(:output) => ExOpenAI.Components.ComputerScreenshotImage.input(),
              required(:status) => ExOpenAI.Components.ComputerCallOutputStatus.input(),
              required(:type) => :computer_call_output | String.t()
            }
  defstruct [:acknowledged_safety_checks, :call_id, :created_by, :id, :output, :status, :type]
end
