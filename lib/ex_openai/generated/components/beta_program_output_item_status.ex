defmodule ExOpenAI.Components.BetaProgramOutputItemStatus do
  @moduledoc """
  Module for representing the OpenAI schema BetaProgramOutputItemStatus.

  ## Type

  `:completed | :incomplete`

  ## Allowed Values

  `"completed"`, `"incomplete"`
  """
  @type t() :: :completed | :incomplete
  @type input() :: (:completed | :incomplete) | String.t()
end
