defmodule ExOpenAI.Components.VoiceIdsOrCustomVoice do
  use ExOpenAI.Jason

  @moduledoc """
  A built-in voice name or a custom voice reference.


  ## Type

  `ExOpenAI.Components.VoiceIdsShared.t() | {:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`
  """
  @type t() :: ExOpenAI.Components.VoiceIdsShared.t() | %{required(:id) => String.t()}
end
