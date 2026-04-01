defmodule ExOpenAI.Components.TranscriptionInclude do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TranscriptionInclude.

  ## Type

  `:logprobs`

  ## Allowed Values

  `"logprobs"`
  """
  @type t() :: :logprobs
end
