defmodule ExOpenAI.Components.ToolCallCaller do
  @moduledoc """
  The execution context that produced this tool call.

  ## Type

  `ExOpenAI.Components.DirectToolCallCaller.t() | ExOpenAI.Components.ProgramToolCallCaller.t()`
  """
  @type t() ::
          ExOpenAI.Components.DirectToolCallCaller.t()
          | ExOpenAI.Components.ProgramToolCallCaller.t()
  @type input() ::
          ExOpenAI.Components.DirectToolCallCaller.input()
          | ExOpenAI.Components.ProgramToolCallCaller.input()
end
