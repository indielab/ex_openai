defmodule ExOpenAI.Components.C2PAValidationStateApi do
  @moduledoc """
  Module for representing the OpenAI schema C2PAValidationStateApi.

  ## Type

  `:trusted | :valid | :invalid | :not_present`

  ## Allowed Values

  `"trusted"`, `"valid"`, `"invalid"`, `"not_present"`
  """
  @type t() :: ((:trusted | :valid) | :invalid) | :not_present
  @type input() :: (((:trusted | :valid) | :invalid) | :not_present) | String.t()
end
