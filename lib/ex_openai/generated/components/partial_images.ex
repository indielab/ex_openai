defmodule ExOpenAI.Components.PartialImages do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema PartialImages.

  ## Type

  `integer() | any()`
  """
  @type t() :: integer() | any()
end
