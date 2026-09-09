defmodule ExOpenAI.Components.FunctionCallOutputStatusEnum do
  @moduledoc """
  Module for representing the OpenAI schema FunctionCallOutputStatusEnum.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
  @type input() :: ((:in_progress | :completed) | :incomplete) | String.t()
end
