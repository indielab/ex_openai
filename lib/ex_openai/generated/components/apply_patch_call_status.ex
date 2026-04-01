defmodule ExOpenAI.Components.ApplyPatchCallStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ApplyPatchCallStatus.

  ## Type

  `:in_progress | :completed`

  ## Allowed Values

  `"in_progress"`, `"completed"`
  """
  @type t() :: :in_progress | :completed
end
