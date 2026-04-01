defmodule ExOpenAI.Components.MessageStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema MessageStatus.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
end
