defmodule ExOpenAI.Components.OrderEnum do
  @moduledoc """
  Module for representing the OpenAI schema OrderEnum.

  ## Type

  `:asc | :desc`

  ## Allowed Values

  `"asc"`, `"desc"`
  """
  @type t() :: :asc | :desc
  @type input() :: (:asc | :desc) | String.t()
end
