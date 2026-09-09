defmodule ExOpenAI.Components.ResponseStreamOptions do
  @moduledoc """
  Module for representing the OpenAI schema ResponseStreamOptions.

  ## Type

  `%{optional(:include_obfuscation) => boolean()} | nil`
  """
  @type t() :: %{optional(:include_obfuscation) => boolean()} | nil
  @type input() :: %{optional(:include_obfuscation) => boolean()} | nil
end
