defmodule ExOpenAI.Components.ToolSearchExecutionType do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ToolSearchExecutionType.

  ## Type

  `:server | :client`

  ## Allowed Values

  `"server"`, `"client"`
  """
  @type t() :: :server | :client
end
