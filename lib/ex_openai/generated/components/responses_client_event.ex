defmodule ExOpenAI.Components.ResponsesClientEvent do
  @moduledoc """
  Client events accepted by the Responses WebSocket server.


  ## Type

  `ExOpenAI.Components.ResponsesClientEventResponseCreate.t()`
  """
  @type t() :: ExOpenAI.Components.ResponsesClientEventResponseCreate.t()
  @type input() :: ExOpenAI.Components.ResponsesClientEventResponseCreate.input()
end
