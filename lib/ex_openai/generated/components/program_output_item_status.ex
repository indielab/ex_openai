defmodule ExOpenAI.Components.ProgramOutputItemStatus do
  @moduledoc """
  Module for representing the OpenAI schema ProgramOutputItemStatus.

  ## Type

  `:completed | :incomplete`

  ## Allowed Values

  `"completed"`, `"incomplete"`
  """
  @type t() :: :completed | :incomplete
  @type input() :: (:completed | :incomplete) | String.t()
end
