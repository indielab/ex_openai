defmodule ExOpenAI.Components.CreateEvalItem do
  use ExOpenAI.Jason

  @moduledoc """
  A chat message that makes up the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
  """
  @type t() :: map()
end
