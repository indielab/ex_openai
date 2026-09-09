defmodule ExOpenAI.Components.NoiseReductionType do
  @moduledoc """
  Type of noise reduction. `near_field` is for close-talking microphones such as headphones, `far_field` is for far-field microphones such as laptop or conference room microphones.


  ## Type

  `:near_field | :far_field`

  ## Allowed Values

  `"near_field"`, `"far_field"`
  """
  @type t() :: :near_field | :far_field
  @type input() :: (:near_field | :far_field) | String.t()
end
