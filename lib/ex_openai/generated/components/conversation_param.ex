defmodule ExOpenAI.Components.ConversationParam do
  use ExOpenAI.Jason

  @moduledoc """
  The conversation that this response belongs to. Items from this conversation are prepended to `input_items` for this response request.
  Input items and output items from this response are automatically added to this conversation after this response completes.


  ## Type

  `String.t() | :"Elixir.ExOpenAI.Components.ConversationParam-2".t()`
  """
  @type t() :: String.t() | :"Elixir.ExOpenAI.Components.ConversationParam-2".t()
end
