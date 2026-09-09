defmodule ExOpenAI.Components.TranscriptionInclude do
  @moduledoc """
  Module for representing the OpenAI schema TranscriptionInclude.

  ## Type

  `:logprobs`

  ## Allowed Values

  `"logprobs"`
  """
  @type t() :: :logprobs
  @type input() :: :logprobs | String.t()
end
