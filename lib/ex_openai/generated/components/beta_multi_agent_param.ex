defmodule ExOpenAI.Components.BetaMultiAgentParam do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for server-hosted multi-agent execution.

  ## Fields

  * `:enabled` - **required** - `boolean()`
    Whether to enable server-hosted multi-agent execution for this response.

  * `:max_concurrent_subagents` - **optional** - `integer()`
    `max_concurrent_subagents` sets the maximum number of subagents that can be active simultaneously across the entire agent tree. It includes all descendants—children, grandchildren, and deeper subagents—but excludes the root agent.
  The API does not impose a fixed upper bound on this setting. The default is `3`, which is recommended for most workloads. Multi-agent runs also have no fixed limit on tree depth or the total number of subagents created during a run.
    Constraints: minimum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          enabled: boolean(),
          max_concurrent_subagents: integer() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{required(:enabled) => boolean(), optional(:max_concurrent_subagents) => integer()}
  defstruct [:enabled, :max_concurrent_subagents]
end
