defmodule ExOpenAI.Components.ServiceTier do
  @moduledoc """
  Module for representing the OpenAI schema ServiceTier.

  ## Type

  `:auto | :default | :flex | :scale | :priority | :fast | nil`
  """
  @type t() :: (((((:auto | :default) | :flex) | :scale) | :priority) | :fast) | nil
  @type input() ::
          ((((((:auto | :default) | :flex) | :scale) | :priority) | :fast) | String.t()) | nil
end
