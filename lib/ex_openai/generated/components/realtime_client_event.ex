defmodule ExOpenAI.Components.RealtimeClientEvent do
  use ExOpenAI.Jason

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
end
