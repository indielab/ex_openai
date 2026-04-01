defmodule ExOpenAI.Components.ResponseModalities do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ResponseModalities.

  ## Type

  `[:text | :audio] | any()`
  """
  @type t() :: list(:text | :audio) | any()
end
