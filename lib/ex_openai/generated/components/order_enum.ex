defmodule ExOpenAI.Components.OrderEnum do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OrderEnum.

  ## Type

  `:asc | :desc`

  ## Allowed Values

  `"asc"`, `"desc"`
  """
  @type t() :: :asc | :desc
end
