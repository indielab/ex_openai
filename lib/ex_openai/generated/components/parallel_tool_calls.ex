defmodule ExOpenAI.Components.ParallelToolCalls do
  use ExOpenAI.Jason

  @moduledoc """
  Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.

  ## Type

  `boolean()`
  """
  @type t() :: boolean()
end
