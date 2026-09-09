defmodule ExOpenAI.Components.VoiceIdsOrCustomVoice do
  @moduledoc """
  A built-in voice name or a custom voice reference.


  ## Type

  `ExOpenAI.Components.VoiceIdsShared.t() | %{required(:id) => String.t()}`
  """
  @type t() :: ExOpenAI.Components.VoiceIdsShared.t() | %{required(:id) => String.t()}
  @type input() :: ExOpenAI.Components.VoiceIdsShared.input() | %{required(:id) => String.t()}
end
