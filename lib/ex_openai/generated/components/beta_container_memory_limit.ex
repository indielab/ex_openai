defmodule ExOpenAI.Components.BetaContainerMemoryLimit do
  @moduledoc """
  Module for representing the OpenAI schema BetaContainerMemoryLimit.

  ## Type

  `:"1g" | :"4g" | :"16g" | :"64g"`

  ## Allowed Values

  `"1g"`, `"4g"`, `"16g"`, `"64g"`
  """
  @type t() :: ((:"1g" | :"4g") | :"16g") | :"64g"
  @type input() :: (((:"1g" | :"4g") | :"16g") | :"64g") | String.t()
end
