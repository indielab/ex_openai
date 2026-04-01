defmodule ExOpenAI.Components.ReasoningEffort do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ReasoningEffort.

  ## Type

  `:none | :minimal | :low | :medium | :high | :xhigh | any()`
  """
  @type t() :: (((((:none | :minimal) | :low) | :medium) | :high) | :xhigh) | any()
end
