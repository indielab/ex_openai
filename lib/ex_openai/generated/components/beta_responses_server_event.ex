defmodule ExOpenAI.Components.BetaResponsesServerEvent do
  @moduledoc """
  Server events emitted by the Responses WebSocket server.


  ## Type

  `ExOpenAI.Components.BetaResponseStreamEvent.t() | ExOpenAI.Components.BetaResponseInjectCreatedEvent.t() | ExOpenAI.Components.BetaResponseInjectFailedEvent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.BetaResponseStreamEvent.t()
           | ExOpenAI.Components.BetaResponseInjectCreatedEvent.t())
          | ExOpenAI.Components.BetaResponseInjectFailedEvent.t()
  @type input() ::
          (ExOpenAI.Components.BetaResponseStreamEvent.input()
           | ExOpenAI.Components.BetaResponseInjectCreatedEvent.input())
          | ExOpenAI.Components.BetaResponseInjectFailedEvent.input()
end
