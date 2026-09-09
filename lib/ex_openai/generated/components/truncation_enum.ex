defmodule ExOpenAI.Components.TruncationEnum do
  @moduledoc """
  Module for representing the OpenAI schema TruncationEnum.

  ## Type

  `:auto | :disabled`

  ## Allowed Values

  `"auto"`, `"disabled"`
  """
  @type t() :: :auto | :disabled
  @type input() :: (:auto | :disabled) | String.t()
end
