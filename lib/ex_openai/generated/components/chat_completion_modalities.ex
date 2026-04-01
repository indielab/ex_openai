defmodule ExOpenAI.Components.ChatCompletionModalities do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionModalities.

  ## Type

  `[:text | :audio] | any()`
  """
  @type t() :: list(:text | :audio) | any()
end
