defmodule ExOpenAI.Components.RealtimeServerEvent do
  use ExOpenAI.Jason

  @moduledoc """
  A realtime server event.


  ## Type

  `ExOpenAI.Components.RealtimeServerEventConversationCreated.t() | ExOpenAI.Components.RealtimeServerEventConversationItemCreated.t() | ExOpenAI.Components.RealtimeServerEventConversationItemDeleted.t() | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionCompleted.t() | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionDelta.t() | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionFailed.t() | ExOpenAI.Components.RealtimeServerEventConversationItemRetrieved.t() | ExOpenAI.Components.RealtimeServerEventConversationItemTruncated.t() | ExOpenAI.Components.RealtimeServerEventError.t() | ExOpenAI.Components.RealtimeServerEventInputAudioBufferCleared.t() | ExOpenAI.Components.RealtimeServerEventInputAudioBufferCommitted.t() | ExOpenAI.Components.RealtimeServerEventInputAudioBufferDtmfEventReceived.t() | ExOpenAI.Components.RealtimeServerEventInputAudioBufferSpeechStarted.t() | ExOpenAI.Components.RealtimeServerEventInputAudioBufferSpeechStopped.t() | ExOpenAI.Components.RealtimeServerEventRateLimitsUpdated.t() | ExOpenAI.Components.RealtimeServerEventResponseAudioDelta.t() | ExOpenAI.Components.RealtimeServerEventResponseAudioDone.t() | ExOpenAI.Components.RealtimeServerEventResponseAudioTranscriptDelta.t() | ExOpenAI.Components.RealtimeServerEventResponseAudioTranscriptDone.t() | ExOpenAI.Components.RealtimeServerEventResponseContentPartAdded.t() | ExOpenAI.Components.RealtimeServerEventResponseContentPartDone.t() | ExOpenAI.Components.RealtimeServerEventResponseCreated.t() | ExOpenAI.Components.RealtimeServerEventResponseDone.t() | ExOpenAI.Components.RealtimeServerEventResponseFunctionCallArgumentsDelta.t() | ExOpenAI.Components.RealtimeServerEventResponseFunctionCallArgumentsDone.t() | ExOpenAI.Components.RealtimeServerEventResponseOutputItemAdded.t() | ExOpenAI.Components.RealtimeServerEventResponseOutputItemDone.t() | ExOpenAI.Components.RealtimeServerEventResponseTextDelta.t() | ExOpenAI.Components.RealtimeServerEventResponseTextDone.t() | ExOpenAI.Components.RealtimeServerEventSessionCreated.t() | ExOpenAI.Components.RealtimeServerEventSessionUpdated.t() | ExOpenAI.Components.RealtimeServerEventOutputAudioBufferStarted.t() | ExOpenAI.Components.RealtimeServerEventOutputAudioBufferStopped.t() | ExOpenAI.Components.RealtimeServerEventOutputAudioBufferCleared.t() | ExOpenAI.Components.RealtimeServerEventConversationItemAdded.t() | ExOpenAI.Components.RealtimeServerEventConversationItemDone.t() | ExOpenAI.Components.RealtimeServerEventInputAudioBufferTimeoutTriggered.t() | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionSegment.t() | ExOpenAI.Components.RealtimeServerEventMCPListToolsInProgress.t() | ExOpenAI.Components.RealtimeServerEventMCPListToolsCompleted.t() | ExOpenAI.Components.RealtimeServerEventMCPListToolsFailed.t() | ExOpenAI.Components.RealtimeServerEventResponseMCPCallArgumentsDelta.t() | ExOpenAI.Components.RealtimeServerEventResponseMCPCallArgumentsDone.t() | ExOpenAI.Components.RealtimeServerEventResponseMCPCallInProgress.t() | ExOpenAI.Components.RealtimeServerEventResponseMCPCallCompleted.t() | ExOpenAI.Components.RealtimeServerEventResponseMCPCallFailed.t()`
  """
  @type t() ::
          ((((((((((((((((((((((((((((((((((((((((((((ExOpenAI.Components.RealtimeServerEventConversationCreated.t()
                                                      | ExOpenAI.Components.RealtimeServerEventConversationItemCreated.t())
                                                     | ExOpenAI.Components.RealtimeServerEventConversationItemDeleted.t())
                                                    | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionCompleted.t())
                                                   | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionDelta.t())
                                                  | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionFailed.t())
                                                 | ExOpenAI.Components.RealtimeServerEventConversationItemRetrieved.t())
                                                | ExOpenAI.Components.RealtimeServerEventConversationItemTruncated.t())
                                               | ExOpenAI.Components.RealtimeServerEventError.t())
                                              | ExOpenAI.Components.RealtimeServerEventInputAudioBufferCleared.t())
                                             | ExOpenAI.Components.RealtimeServerEventInputAudioBufferCommitted.t())
                                            | ExOpenAI.Components.RealtimeServerEventInputAudioBufferDtmfEventReceived.t())
                                           | ExOpenAI.Components.RealtimeServerEventInputAudioBufferSpeechStarted.t())
                                          | ExOpenAI.Components.RealtimeServerEventInputAudioBufferSpeechStopped.t())
                                         | ExOpenAI.Components.RealtimeServerEventRateLimitsUpdated.t())
                                        | ExOpenAI.Components.RealtimeServerEventResponseAudioDelta.t())
                                       | ExOpenAI.Components.RealtimeServerEventResponseAudioDone.t())
                                      | ExOpenAI.Components.RealtimeServerEventResponseAudioTranscriptDelta.t())
                                     | ExOpenAI.Components.RealtimeServerEventResponseAudioTranscriptDone.t())
                                    | ExOpenAI.Components.RealtimeServerEventResponseContentPartAdded.t())
                                   | ExOpenAI.Components.RealtimeServerEventResponseContentPartDone.t())
                                  | ExOpenAI.Components.RealtimeServerEventResponseCreated.t())
                                 | ExOpenAI.Components.RealtimeServerEventResponseDone.t())
                                | ExOpenAI.Components.RealtimeServerEventResponseFunctionCallArgumentsDelta.t())
                               | ExOpenAI.Components.RealtimeServerEventResponseFunctionCallArgumentsDone.t())
                              | ExOpenAI.Components.RealtimeServerEventResponseOutputItemAdded.t())
                             | ExOpenAI.Components.RealtimeServerEventResponseOutputItemDone.t())
                            | ExOpenAI.Components.RealtimeServerEventResponseTextDelta.t())
                           | ExOpenAI.Components.RealtimeServerEventResponseTextDone.t())
                          | ExOpenAI.Components.RealtimeServerEventSessionCreated.t())
                         | ExOpenAI.Components.RealtimeServerEventSessionUpdated.t())
                        | ExOpenAI.Components.RealtimeServerEventOutputAudioBufferStarted.t())
                       | ExOpenAI.Components.RealtimeServerEventOutputAudioBufferStopped.t())
                      | ExOpenAI.Components.RealtimeServerEventOutputAudioBufferCleared.t())
                     | ExOpenAI.Components.RealtimeServerEventConversationItemAdded.t())
                    | ExOpenAI.Components.RealtimeServerEventConversationItemDone.t())
                   | ExOpenAI.Components.RealtimeServerEventInputAudioBufferTimeoutTriggered.t())
                  | ExOpenAI.Components.RealtimeServerEventConversationItemInputAudioTranscriptionSegment.t())
                 | ExOpenAI.Components.RealtimeServerEventMCPListToolsInProgress.t())
                | ExOpenAI.Components.RealtimeServerEventMCPListToolsCompleted.t())
               | ExOpenAI.Components.RealtimeServerEventMCPListToolsFailed.t())
              | ExOpenAI.Components.RealtimeServerEventResponseMCPCallArgumentsDelta.t())
             | ExOpenAI.Components.RealtimeServerEventResponseMCPCallArgumentsDone.t())
            | ExOpenAI.Components.RealtimeServerEventResponseMCPCallInProgress.t())
           | ExOpenAI.Components.RealtimeServerEventResponseMCPCallCompleted.t())
          | ExOpenAI.Components.RealtimeServerEventResponseMCPCallFailed.t()
end
