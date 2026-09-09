defmodule ExOpenAI.Components.CreateSpeechResponseStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema CreateSpeechResponseStreamEvent.

  ## Type

  `ExOpenAI.Components.SpeechAudioDeltaEvent.t() | ExOpenAI.Components.SpeechAudioDoneEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.SpeechAudioDeltaEvent.t()
          | ExOpenAI.Components.SpeechAudioDoneEvent.t()
  @type input() ::
          ExOpenAI.Components.SpeechAudioDeltaEvent.input()
          | ExOpenAI.Components.SpeechAudioDoneEvent.input()
end
