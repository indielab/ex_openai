defmodule ExOpenAI.Components.ServiceTier do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ServiceTier.

  ## Type

  `:auto | :default | :flex | :scale | :priority | any()`
  """
  @type t() :: ((((:auto | :default) | :flex) | :scale) | :priority) | any()
end
