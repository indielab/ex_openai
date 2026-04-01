defmodule ExOpenAI.Components.Filters do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Filters.

  ## Type

  `ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t()`
  """
  @type t() :: ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t()
end
