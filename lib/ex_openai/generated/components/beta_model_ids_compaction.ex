defmodule ExOpenAI.Components.BetaModelIdsCompaction do
  @moduledoc """
  Model ID used to generate the response, like `gpt-5` or `o3`. OpenAI offers a wide range of models with different capabilities, performance characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models) to browse and compare available models.

  ## Type

  `ExOpenAI.Components.BetaModelIdsResponses.t() | String.t() | nil`
  """
  @type t() :: (ExOpenAI.Components.BetaModelIdsResponses.t() | String.t()) | nil
  @type input() :: (ExOpenAI.Components.BetaModelIdsResponses.input() | String.t()) | nil
end
