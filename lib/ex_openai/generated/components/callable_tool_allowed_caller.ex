defmodule ExOpenAI.Components.CallableToolAllowedCaller do
  @moduledoc """
  Module for representing the OpenAI schema CallableToolAllowedCaller.

  ## Type

  `:direct | :programmatic`

  ## Allowed Values

  `"direct"`, `"programmatic"`
  """
  @type t() :: :direct | :programmatic
  @type input() :: (:direct | :programmatic) | String.t()
end
