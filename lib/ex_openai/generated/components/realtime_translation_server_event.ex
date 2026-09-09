defmodule ExOpenAI.Components.RealtimeTranslationServerEvent do
  @moduledoc """
  A Realtime translation server event.


  ## Type

  `ExOpenAI.Components.RealtimeServerEventError.t() | ExOpenAI.Components.RealtimeTranslationServerEventSessionCreated.t() | ExOpenAI.Components.RealtimeTranslationServerEventSessionUpdated.t() | ExOpenAI.Components.RealtimeTranslationServerEventSessionClosed.t() | ExOpenAI.Components.RealtimeTranslationServerEventSessionInputTranscriptDelta.t() | ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputTranscriptDelta.t() | ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputAudioDelta.t()`
  """
  @type t() ::
          (((((ExOpenAI.Components.RealtimeServerEventError.t()
               | ExOpenAI.Components.RealtimeTranslationServerEventSessionCreated.t())
              | ExOpenAI.Components.RealtimeTranslationServerEventSessionUpdated.t())
             | ExOpenAI.Components.RealtimeTranslationServerEventSessionClosed.t())
            | ExOpenAI.Components.RealtimeTranslationServerEventSessionInputTranscriptDelta.t())
           | ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputTranscriptDelta.t())
          | ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputAudioDelta.t()
  @type input() ::
          (((((ExOpenAI.Components.RealtimeServerEventError.input()
               | ExOpenAI.Components.RealtimeTranslationServerEventSessionCreated.input())
              | ExOpenAI.Components.RealtimeTranslationServerEventSessionUpdated.input())
             | ExOpenAI.Components.RealtimeTranslationServerEventSessionClosed.input())
            | ExOpenAI.Components.RealtimeTranslationServerEventSessionInputTranscriptDelta.input())
           | ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputTranscriptDelta.input())
          | ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputAudioDelta.input()
end
