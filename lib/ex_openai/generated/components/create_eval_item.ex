defmodule ExOpenAI.Components.CreateEvalItem do
  @moduledoc """
  A chat message that makes up the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
  """
  @type t() :: map()
  @type input() ::
          %{required(:content) => String.t(), required(:role) => String.t()}
          | ExOpenAI.Components.EvalItem.input()
end
