defmodule ExOpenAI.Components.ModelIdsCompaction do
  use ExOpenAI.Jason

  @moduledoc """
  Model ID used to generate the response, like `gpt-5` or `o3`. OpenAI offers a wide range of models with different capabilities, performance characteristics, and price points. Refer to the [model guide](/docs/models) to browse and compare available models.

  ## Type

  `ExOpenAI.Components.ModelIdsResponses.t() | String.t() | any()`
  """
  @type t() :: (ExOpenAI.Components.ModelIdsResponses.t() | String.t()) | any()
end
