defmodule ExOpenAI.Components.ResponsesServerEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Server events emitted by the Responses WebSocket server.


  ## Type

  `ExOpenAI.Components.ResponseStreamEvent.t()`
  """
  @type t() :: ExOpenAI.Components.ResponseStreamEvent.t()
end
