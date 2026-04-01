defmodule ExOpenAI.Components.CreateSpeechResponseStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateSpeechResponseStreamEvent.

  ## Type

  `ExOpenAI.Components.SpeechAudioDeltaEvent.t() | ExOpenAI.Components.SpeechAudioDoneEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.SpeechAudioDeltaEvent.t()
          | ExOpenAI.Components.SpeechAudioDoneEvent.t()
end
