defmodule ExOpenAI.Components.RealtimeClientEvent do
  @moduledoc """
  A realtime client event.


  ## Type

  `ExOpenAI.Components.RealtimeClientEventConversationItemCreate.t() | ExOpenAI.Components.RealtimeClientEventConversationItemDelete.t() | ExOpenAI.Components.RealtimeClientEventConversationItemRetrieve.t() | ExOpenAI.Components.RealtimeClientEventConversationItemTruncate.t() | ExOpenAI.Components.RealtimeClientEventInputAudioBufferAppend.t() | ExOpenAI.Components.RealtimeClientEventInputAudioBufferClear.t() | ExOpenAI.Components.RealtimeClientEventOutputAudioBufferClear.t() | ExOpenAI.Components.RealtimeClientEventInputAudioBufferCommit.t() | ExOpenAI.Components.RealtimeClientEventResponseCancel.t() | ExOpenAI.Components.RealtimeClientEventResponseCreate.t() | ExOpenAI.Components.RealtimeClientEventSessionUpdate.t()`
  """
  @type t() ::
          (((((((((ExOpenAI.Components.RealtimeClientEventConversationItemCreate.t()
                   | ExOpenAI.Components.RealtimeClientEventConversationItemDelete.t())
                  | ExOpenAI.Components.RealtimeClientEventConversationItemRetrieve.t())
                 | ExOpenAI.Components.RealtimeClientEventConversationItemTruncate.t())
                | ExOpenAI.Components.RealtimeClientEventInputAudioBufferAppend.t())
               | ExOpenAI.Components.RealtimeClientEventInputAudioBufferClear.t())
              | ExOpenAI.Components.RealtimeClientEventOutputAudioBufferClear.t())
             | ExOpenAI.Components.RealtimeClientEventInputAudioBufferCommit.t())
            | ExOpenAI.Components.RealtimeClientEventResponseCancel.t())
           | ExOpenAI.Components.RealtimeClientEventResponseCreate.t())
          | ExOpenAI.Components.RealtimeClientEventSessionUpdate.t()
  @type input() ::
          (((((((((ExOpenAI.Components.RealtimeClientEventConversationItemCreate.input()
                   | ExOpenAI.Components.RealtimeClientEventConversationItemDelete.input())
                  | ExOpenAI.Components.RealtimeClientEventConversationItemRetrieve.input())
                 | ExOpenAI.Components.RealtimeClientEventConversationItemTruncate.input())
                | ExOpenAI.Components.RealtimeClientEventInputAudioBufferAppend.input())
               | ExOpenAI.Components.RealtimeClientEventInputAudioBufferClear.input())
              | ExOpenAI.Components.RealtimeClientEventOutputAudioBufferClear.input())
             | ExOpenAI.Components.RealtimeClientEventInputAudioBufferCommit.input())
            | ExOpenAI.Components.RealtimeClientEventResponseCancel.input())
           | ExOpenAI.Components.RealtimeClientEventResponseCreate.input())
          | ExOpenAI.Components.RealtimeClientEventSessionUpdate.input()
end
