defmodule ExOpenAI.Components.TaskType do
  @moduledoc """
  Module for representing the OpenAI schema TaskType.

  ## Type

  `:custom | :thought`

  ## Allowed Values

  `"custom"`, `"thought"`
  """
  @type t() :: :custom | :thought
  @type input() :: (:custom | :thought) | String.t()
end
