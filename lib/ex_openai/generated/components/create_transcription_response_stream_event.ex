defmodule ExOpenAI.Components.CreateTranscriptionResponseStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema CreateTranscriptionResponseStreamEvent.

  ## Type

  `ExOpenAI.Components.TranscriptTextSegmentEvent.t() | ExOpenAI.Components.TranscriptTextDeltaEvent.t() | ExOpenAI.Components.TranscriptTextDoneEvent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.TranscriptTextSegmentEvent.t()
           | ExOpenAI.Components.TranscriptTextDeltaEvent.t())
          | ExOpenAI.Components.TranscriptTextDoneEvent.t()
  @type input() ::
          (ExOpenAI.Components.TranscriptTextSegmentEvent.input()
           | ExOpenAI.Components.TranscriptTextDeltaEvent.input())
          | ExOpenAI.Components.TranscriptTextDoneEvent.input()
end
