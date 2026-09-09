defmodule ExOpenAI.Components.ParallelToolCalls do
  @moduledoc """
  Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.

  ## Type

  `boolean()`
  """
  @type t() :: boolean()
  @type input() :: boolean()
end
