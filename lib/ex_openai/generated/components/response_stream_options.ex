defmodule ExOpenAI.Components.ResponseStreamOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ResponseStreamOptions.

  ## Type

  `{:%{}, [], [{{:optional, [], [:include_obfuscation]}, {:boolean, [], []}}]} | any()`
  """
  @type t() :: %{optional(:include_obfuscation) => boolean()} | any()
end
