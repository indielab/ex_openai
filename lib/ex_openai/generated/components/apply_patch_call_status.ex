defmodule ExOpenAI.Components.ApplyPatchCallStatus do
  @moduledoc """
  Module for representing the OpenAI schema ApplyPatchCallStatus.

  ## Type

  `:in_progress | :completed`

  ## Allowed Values

  `"in_progress"`, `"completed"`
  """
  @type t() :: :in_progress | :completed
  @type input() :: (:in_progress | :completed) | String.t()
end
