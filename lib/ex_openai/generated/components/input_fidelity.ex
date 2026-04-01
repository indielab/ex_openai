defmodule ExOpenAI.Components.InputFidelity do
  use ExOpenAI.Jason

  @moduledoc """
  Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.

  ## Type

  `:high | :low`

  ## Allowed Values

  `"high"`, `"low"`
  """
  @type t() :: :high | :low
end
