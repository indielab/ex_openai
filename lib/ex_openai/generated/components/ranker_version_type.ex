defmodule ExOpenAI.Components.RankerVersionType do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RankerVersionType.

  ## Type

  `:auto | :"default-2024-11-15"`

  ## Allowed Values

  `"auto"`, `"default-2024-11-15"`
  """
  @type t() :: :auto | :"default-2024-11-15"
end
