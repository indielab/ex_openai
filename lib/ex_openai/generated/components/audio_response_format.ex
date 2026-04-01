defmodule ExOpenAI.Components.AudioResponseFormat do
  use ExOpenAI.Jason

  @moduledoc """
  The format of the output, in one of these options: `json`, `text`, `srt`, `verbose_json`, `vtt`, or `diarized_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized_json`, with `diarized_json` required to receive speaker annotations.


  ## Type

  `:json | :text | :srt | :verbose_json | :vtt | :diarized_json`

  ## Allowed Values

  `"json"`, `"text"`, `"srt"`, `"verbose_json"`, `"vtt"`, `"diarized_json"`
  """
  @type t() :: ((((:json | :text) | :srt) | :verbose_json) | :vtt) | :diarized_json
end
