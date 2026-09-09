defmodule ExOpenAI.Components.ReasoningEffort do
  @moduledoc """
  Module for representing the OpenAI schema ReasoningEffort.

  ## Type

  `:none | :minimal | :low | :medium | :high | :xhigh | :max | nil`
  """
  @type t() :: ((((((:none | :minimal) | :low) | :medium) | :high) | :xhigh) | :max) | nil
  @type input() ::
          (((((((:none | :minimal) | :low) | :medium) | :high) | :xhigh) | :max) | String.t())
          | nil
end
