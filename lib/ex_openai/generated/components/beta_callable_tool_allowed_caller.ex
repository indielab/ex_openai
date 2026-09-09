defmodule ExOpenAI.Components.BetaCallableToolAllowedCaller do
  @moduledoc """
  Module for representing the OpenAI schema BetaCallableToolAllowedCaller.

  ## Type

  `:direct | :programmatic`

  ## Allowed Values

  `"direct"`, `"programmatic"`
  """
  @type t() :: :direct | :programmatic
  @type input() :: (:direct | :programmatic) | String.t()
end
