defmodule ExOpenAI.Components.CreateTranscriptionResponseStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateTranscriptionResponseStreamEvent.

  ## Type

  `ExOpenAI.Components.TranscriptTextSegmentEvent.t() | ExOpenAI.Components.TranscriptTextDeltaEvent.t() | ExOpenAI.Components.TranscriptTextDoneEvent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.TranscriptTextSegmentEvent.t()
           | ExOpenAI.Components.TranscriptTextDeltaEvent.t())
          | ExOpenAI.Components.TranscriptTextDoneEvent.t()
end
