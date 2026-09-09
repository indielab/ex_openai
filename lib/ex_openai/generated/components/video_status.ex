defmodule ExOpenAI.Components.VideoStatus do
  @moduledoc """
  Module for representing the OpenAI schema VideoStatus.

  ## Type

  `:queued | :in_progress | :completed | :failed`

  ## Allowed Values

  `"queued"`, `"in_progress"`, `"completed"`, `"failed"`
  """
  @type t() :: ((:queued | :in_progress) | :completed) | :failed
  @type input() :: (((:queued | :in_progress) | :completed) | :failed) | String.t()
end
