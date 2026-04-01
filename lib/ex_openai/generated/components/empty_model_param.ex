defmodule ExOpenAI.Components.EmptyModelParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema EmptyModelParam.
  """
  @type t() :: %{__struct__: __MODULE__}
  defstruct []
end
