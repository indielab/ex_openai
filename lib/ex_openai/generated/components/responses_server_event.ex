defmodule ExOpenAI.Components.ResponsesServerEvent do
  @moduledoc """
  Server events emitted by the Responses WebSocket server.


  ## Type

  `ExOpenAI.Components.ResponseStreamEvent.t()`
  """
  @type t() :: ExOpenAI.Components.ResponseStreamEvent.t()
  @type input() :: ExOpenAI.Components.ResponseStreamEvent.input()
end
