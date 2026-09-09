defmodule ExOpenAI.Components.BetaReasoningEffort do
  @moduledoc """
  Module for representing the OpenAI schema BetaReasoningEffort.

  ## Type

  `:none | :minimal | :low | :medium | :high | :xhigh | :max | nil`
  """
  @type t() :: ((((((:none | :minimal) | :low) | :medium) | :high) | :xhigh) | :max) | nil
  @type input() ::
          (((((((:none | :minimal) | :low) | :medium) | :high) | :xhigh) | :max) | String.t())
          | nil
end
