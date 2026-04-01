defmodule ExOpenAI.Components.ModelIds do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ModelIds.

  ## Type

  `ExOpenAI.Components.ModelIdsShared.t() | ExOpenAI.Components.ModelIdsResponses.t()`
  """
  @type t() :: ExOpenAI.Components.ModelIdsShared.t() | ExOpenAI.Components.ModelIdsResponses.t()
end
