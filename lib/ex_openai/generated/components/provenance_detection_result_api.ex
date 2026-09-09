defmodule ExOpenAI.Components.ProvenanceDetectionResultApi do
  @moduledoc """
  Module for representing the OpenAI schema ProvenanceDetectionResultApi.

  ## Type

  `:detected | :not_detected`

  ## Allowed Values

  `"detected"`, `"not_detected"`
  """
  @type t() :: :detected | :not_detected
  @type input() :: (:detected | :not_detected) | String.t()
end
