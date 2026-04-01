defmodule ExOpenAI.Components.TaskType do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TaskType.

  ## Type

  `:custom | :thought`

  ## Allowed Values

  `"custom"`, `"thought"`
  """
  @type t() :: :custom | :thought
end
