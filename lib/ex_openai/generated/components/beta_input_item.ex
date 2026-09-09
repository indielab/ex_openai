defmodule ExOpenAI.Components.BetaInputItem do
  @moduledoc """
  Module for representing the OpenAI schema BetaInputItem.

  ## Type

  `ExOpenAI.Components.BetaEasyInputMessage.t() | map() | ExOpenAI.Components.BetaCompactionTriggerItemParam.t() | ExOpenAI.Components.BetaItemReferenceParam.t() | ExOpenAI.Components.BetaProgramItemParam.t() | ExOpenAI.Components.BetaProgramOutputItemParam.t()`
  """
  @type t() ::
          ((((ExOpenAI.Components.BetaEasyInputMessage.t() | map())
             | ExOpenAI.Components.BetaCompactionTriggerItemParam.t())
            | ExOpenAI.Components.BetaItemReferenceParam.t())
           | ExOpenAI.Components.BetaProgramItemParam.t())
          | ExOpenAI.Components.BetaProgramOutputItemParam.t()
  @type input() ::
          ((((ExOpenAI.Components.BetaEasyInputMessage.input()
              | ExOpenAI.Components.BetaItem.input())
             | ExOpenAI.Components.BetaCompactionTriggerItemParam.input())
            | ExOpenAI.Components.BetaItemReferenceParam.input())
           | ExOpenAI.Components.BetaProgramItemParam.input())
          | ExOpenAI.Components.BetaProgramOutputItemParam.input()
end
