defmodule ExOpenAI.Components.StopConfiguration do
  use ExOpenAI.Jason

  @moduledoc """
  Not supported with latest reasoning models `o3` and `o4-mini`.

  Up to 4 sequences where the API will stop generating further tokens. The
  returned text will not contain the stop sequence.


  ## Type

  `String.t() | nil | [String.t()] | nil`
  """
  @type t() :: ((String.t() | nil) | list(String.t())) | nil
end
