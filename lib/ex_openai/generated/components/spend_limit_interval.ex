defmodule ExOpenAI.Components.SpendLimitInterval do
  @moduledoc """
  Module for representing the OpenAI schema SpendLimitInterval.

  ## Type

  `String.t() | :month`
  """
  @type t() :: String.t() | :month
  @type input() :: String.t() | :month | String.t()
end
