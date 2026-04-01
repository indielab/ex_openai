defmodule :"Elixir.ExOpenAI.Components.MessagePhase-2" do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema MessagePhase-2.

  ## Type

  `:commentary | :final_answer`

  ## Allowed Values

  `"commentary"`, `"final_answer"`
  """
  @type t() :: :commentary | :final_answer
end
