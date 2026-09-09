defmodule ExOpenAI.Components.ModelIds do
  @moduledoc """
  Module for representing the OpenAI schema ModelIds.

  ## Type

  `ExOpenAI.Components.ModelIdsShared.t() | ExOpenAI.Components.ModelIdsResponses.t()`
  """
  @type t() :: ExOpenAI.Components.ModelIdsShared.t() | ExOpenAI.Components.ModelIdsResponses.t()
  @type input() ::
          ExOpenAI.Components.ModelIdsShared.input()
          | ExOpenAI.Components.ModelIdsResponses.input()
end
