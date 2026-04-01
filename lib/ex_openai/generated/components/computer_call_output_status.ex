defmodule ExOpenAI.Components.ComputerCallOutputStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ComputerCallOutputStatus.

  ## Type

  `:completed | :incomplete | :failed`

  ## Allowed Values

  `"completed"`, `"incomplete"`, `"failed"`
  """
  @type t() :: (:completed | :incomplete) | :failed
end
