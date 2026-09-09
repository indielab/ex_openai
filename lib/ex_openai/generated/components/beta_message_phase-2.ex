defmodule :"Elixir.ExOpenAI.Components.BetaMessagePhase-2" do
  @moduledoc """
  Module for representing the OpenAI schema BetaMessagePhase-2.

  ## Type

  `:commentary | :final_answer`

  ## Allowed Values

  `"commentary"`, `"final_answer"`
  """
  @type t() :: :commentary | :final_answer
  @type input() :: (:commentary | :final_answer) | String.t()
end
