defmodule ExOpenAI.Components.ResponseModalities do
  @moduledoc """
  Module for representing the OpenAI schema ResponseModalities.

  ## Type

  `list(:text | :audio) | nil`
  """
  @type t() :: list(:text | :audio) | nil
  @type input() :: list((:text | :audio) | String.t()) | nil
end
