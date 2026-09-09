defmodule ExOpenAI.Components.BetaTruncationEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaTruncationEnum.

  ## Type

  `:auto | :disabled`

  ## Allowed Values

  `"auto"`, `"disabled"`
  """
  @type t() :: :auto | :disabled
  @type input() :: (:auto | :disabled) | String.t()
end
