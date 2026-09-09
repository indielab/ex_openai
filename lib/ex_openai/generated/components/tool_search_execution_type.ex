defmodule ExOpenAI.Components.ToolSearchExecutionType do
  @moduledoc """
  Module for representing the OpenAI schema ToolSearchExecutionType.

  ## Type

  `:server | :client`

  ## Allowed Values

  `"server"`, `"client"`
  """
  @type t() :: :server | :client
  @type input() :: (:server | :client) | String.t()
end
