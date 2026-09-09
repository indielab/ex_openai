defmodule ExOpenAI.Components.Filters do
  @moduledoc """
  Module for representing the OpenAI schema Filters.

  ## Type

  `ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t()`
  """
  @type t() :: ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t()
  @type input() ::
          ExOpenAI.Components.ComparisonFilter.input()
          | ExOpenAI.Components.CompoundFilter.input()
end
