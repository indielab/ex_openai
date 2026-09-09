defmodule ExOpenAI.Components.BetaProgramOutputStatus do
  @moduledoc """
  Module for representing the OpenAI schema BetaProgramOutputStatus.

  ## Type

  `:completed | :incomplete`

  ## Allowed Values

  `"completed"`, `"incomplete"`
  """
  @type t() :: :completed | :incomplete
  @type input() :: (:completed | :incomplete) | String.t()
end
