defmodule ExOpenAI.Components.BetaResponsesClientEvent do
  @moduledoc """
  Client events accepted by the Responses WebSocket server.


  ## Type

  `ExOpenAI.Components.BetaResponsesClientEventResponseCreate.t() | ExOpenAI.Components.BetaResponseInjectEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaResponsesClientEventResponseCreate.t()
          | ExOpenAI.Components.BetaResponseInjectEvent.t()
  @type input() ::
          ExOpenAI.Components.BetaResponsesClientEventResponseCreate.input()
          | ExOpenAI.Components.BetaResponseInjectEvent.input()
end
