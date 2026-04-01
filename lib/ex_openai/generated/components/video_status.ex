defmodule ExOpenAI.Components.VideoStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VideoStatus.

  ## Type

  `:queued | :in_progress | :completed | :failed`

  ## Allowed Values

  `"queued"`, `"in_progress"`, `"completed"`, `"failed"`
  """
  @type t() :: ((:queued | :in_progress) | :completed) | :failed
end
