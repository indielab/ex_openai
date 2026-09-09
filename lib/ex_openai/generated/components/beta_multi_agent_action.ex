defmodule ExOpenAI.Components.BetaMultiAgentAction do
  @moduledoc """
  Module for representing the OpenAI schema BetaMultiAgentAction.

  ## Type

  `:spawn_agent | :interrupt_agent | :list_agents | :send_message | :followup_task | :wait_agent`

  ## Allowed Values

  `"spawn_agent"`, `"interrupt_agent"`, `"list_agents"`, `"send_message"`, `"followup_task"`, `"wait_agent"`
  """
  @type t() ::
          ((((:spawn_agent | :interrupt_agent) | :list_agents) | :send_message) | :followup_task)
          | :wait_agent
  @type input() ::
          (((((:spawn_agent | :interrupt_agent) | :list_agents) | :send_message) | :followup_task)
           | :wait_agent)
          | String.t()
end
