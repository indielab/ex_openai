defmodule ExOpenAI.Components.FunctionCallOutputStatusEnum do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FunctionCallOutputStatusEnum.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
end
