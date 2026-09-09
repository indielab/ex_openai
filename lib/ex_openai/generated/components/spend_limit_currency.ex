defmodule ExOpenAI.Components.SpendLimitCurrency do
  @moduledoc """
  Module for representing the OpenAI schema SpendLimitCurrency.

  ## Type

  `String.t() | :USD`
  """
  @type t() :: String.t() | :USD
  @type input() :: String.t() | :USD | String.t()
end
