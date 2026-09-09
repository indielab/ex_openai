defmodule ExOpenAI.Components.ProgramOutputStatus do
  @moduledoc """
  Module for representing the OpenAI schema ProgramOutputStatus.

  ## Type

  `:completed | :incomplete`

  ## Allowed Values

  `"completed"`, `"incomplete"`
  """
  @type t() :: :completed | :incomplete
  @type input() :: (:completed | :incomplete) | String.t()
end
