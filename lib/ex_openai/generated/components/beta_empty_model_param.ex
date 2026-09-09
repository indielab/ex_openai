defmodule ExOpenAI.Components.BetaEmptyModelParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaEmptyModelParam.
  """
  @type t() :: %{__struct__: __MODULE__}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | map()
  defstruct []
end
