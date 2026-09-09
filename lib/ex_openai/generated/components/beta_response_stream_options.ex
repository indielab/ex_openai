defmodule ExOpenAI.Components.BetaResponseStreamOptions do
  @moduledoc """
  Module for representing the OpenAI schema BetaResponseStreamOptions.

  ## Type

  `%{optional(:include_obfuscation) => boolean()} | nil`
  """
  @type t() :: %{optional(:include_obfuscation) => boolean()} | nil
  @type input() :: %{optional(:include_obfuscation) => boolean()} | nil
end
