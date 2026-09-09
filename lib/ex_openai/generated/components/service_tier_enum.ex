defmodule ExOpenAI.Components.ServiceTierEnum do
  @moduledoc """
  Module for representing the OpenAI schema ServiceTierEnum.

  ## Type

  `:auto | :default | :fast | :flex | :priority`

  ## Allowed Values

  `"auto"`, `"default"`, `"fast"`, `"flex"`, `"priority"`
  """
  @type t() :: (((:auto | :default) | :fast) | :flex) | :priority
  @type input() :: ((((:auto | :default) | :fast) | :flex) | :priority) | String.t()
end
