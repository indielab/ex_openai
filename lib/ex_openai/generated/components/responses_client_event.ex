defmodule ExOpenAI.Components.ResponsesClientEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Client events accepted by the Responses WebSocket server.


  ## Type

  `ExOpenAI.Components.ResponsesClientEventResponseCreate.t()`
  """
  @type t() :: ExOpenAI.Components.ResponsesClientEventResponseCreate.t()
end
