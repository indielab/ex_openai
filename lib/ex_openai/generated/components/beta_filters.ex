defmodule ExOpenAI.Components.BetaFilters do
  @moduledoc """
  Module for representing the OpenAI schema BetaFilters.

  ## Type

  `ExOpenAI.Components.BetaComparisonFilter.t() | ExOpenAI.Components.BetaCompoundFilter.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaComparisonFilter.t()
          | ExOpenAI.Components.BetaCompoundFilter.t()
  @type input() ::
          ExOpenAI.Components.BetaComparisonFilter.input()
          | ExOpenAI.Components.BetaCompoundFilter.input()
end
