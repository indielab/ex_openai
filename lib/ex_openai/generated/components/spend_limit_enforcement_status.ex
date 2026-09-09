defmodule ExOpenAI.Components.SpendLimitEnforcementStatus do
  @moduledoc """
  Module for representing the OpenAI schema SpendLimitEnforcementStatus.

  ## Type

  `String.t() | :inactive | :enforcing`
  """
  @type t() :: String.t() | :inactive | :enforcing
  @type input() :: String.t() | (:inactive | :enforcing) | String.t()
end
