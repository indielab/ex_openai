defmodule ExOpenAI.Components.BetaToolSearchExecutionType do
  @moduledoc """
  Module for representing the OpenAI schema BetaToolSearchExecutionType.

  ## Type

  `:server | :client`

  ## Allowed Values

  `"server"`, `"client"`
  """
  @type t() :: :server | :client
  @type input() :: (:server | :client) | String.t()
end
