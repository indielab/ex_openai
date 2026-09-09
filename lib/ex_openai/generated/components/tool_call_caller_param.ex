defmodule ExOpenAI.Components.ToolCallCallerParam do
  @moduledoc """
  The execution context that produced this tool call.

  ## Type

  `ExOpenAI.Components.DirectToolCallCallerParam.t() | ExOpenAI.Components.ProgramToolCallCallerParam.t()`
  """
  @type t() ::
          ExOpenAI.Components.DirectToolCallCallerParam.t()
          | ExOpenAI.Components.ProgramToolCallCallerParam.t()
  @type input() ::
          ExOpenAI.Components.DirectToolCallCallerParam.input()
          | ExOpenAI.Components.ProgramToolCallCallerParam.input()
end
