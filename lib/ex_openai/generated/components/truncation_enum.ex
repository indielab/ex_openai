defmodule ExOpenAI.Components.TruncationEnum do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TruncationEnum.

  ## Type

  `:auto | :disabled`

  ## Allowed Values

  `"auto"`, `"disabled"`
  """
  @type t() :: :auto | :disabled
end
