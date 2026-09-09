defmodule ExOpenAI.Components.ChatCompletionModalities do
  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionModalities.

  ## Type

  `list(:text | :audio) | nil`
  """
  @type t() :: list(:text | :audio) | nil
  @type input() :: list((:text | :audio) | String.t()) | nil
end
