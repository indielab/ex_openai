defmodule ExOpenAI.Components.RealtimeTranslationClientEvent do
  @moduledoc """
  A Realtime translation client event.


  ## Type

  `ExOpenAI.Components.RealtimeTranslationClientEventSessionUpdate.t() | ExOpenAI.Components.RealtimeTranslationClientEventInputAudioBufferAppend.t() | ExOpenAI.Components.RealtimeTranslationClientEventSessionClose.t()`
  """
  @type t() ::
          (ExOpenAI.Components.RealtimeTranslationClientEventSessionUpdate.t()
           | ExOpenAI.Components.RealtimeTranslationClientEventInputAudioBufferAppend.t())
          | ExOpenAI.Components.RealtimeTranslationClientEventSessionClose.t()
  @type input() ::
          (ExOpenAI.Components.RealtimeTranslationClientEventSessionUpdate.input()
           | ExOpenAI.Components.RealtimeTranslationClientEventInputAudioBufferAppend.input())
          | ExOpenAI.Components.RealtimeTranslationClientEventSessionClose.input()
end
