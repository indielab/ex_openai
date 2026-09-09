defmodule ExOpenAI.Components.RunStepDetailsToolCallsObject do
  use ExOpenAI.Jason

  @moduledoc """
  Details of the tool call.

  ## Fields

  * `:tool_calls` - **required** - `list( ExOpenAI.Components.RunStepDetailsToolCallsCodeObject.t() | ExOpenAI.Components.RunStepDetailsToolCallsFileSearchObject.t() | ExOpenAI.Components.RunStepDetailsToolCallsFunctionObject.t() )`
    An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code_interpreter`, `file_search`, or `function`.

  * `:type` - **required** - `:tool_calls`
    Always `tool_calls`.
    Allowed values: `"tool_calls"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          tool_calls:
            list(
              (ExOpenAI.Components.RunStepDetailsToolCallsCodeObject.t()
               | ExOpenAI.Components.RunStepDetailsToolCallsFileSearchObject.t())
              | ExOpenAI.Components.RunStepDetailsToolCallsFunctionObject.t()
            ),
          type: :tool_calls
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:tool_calls) =>
                list(
                  (ExOpenAI.Components.RunStepDetailsToolCallsCodeObject.input()
                   | ExOpenAI.Components.RunStepDetailsToolCallsFileSearchObject.input())
                  | ExOpenAI.Components.RunStepDetailsToolCallsFunctionObject.input()
                ),
              required(:type) => :tool_calls | String.t()
            }
  defstruct [:tool_calls, :type]
end
