defmodule ExOpenAI.Components.ContainerMemoryLimit do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ContainerMemoryLimit.

  ## Type

  `:"1g" | :"4g" | :"16g" | :"64g"`

  ## Allowed Values

  `"1g"`, `"4g"`, `"16g"`, `"64g"`
  """
  @type t() :: ((:"1g" | :"4g") | :"16g") | :"64g"
end
