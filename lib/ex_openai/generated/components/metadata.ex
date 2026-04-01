defmodule ExOpenAI.Components.Metadata do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Metadata.

  ## Type

  `map() | any()`
  """
  @type t() :: map() | any()
end
