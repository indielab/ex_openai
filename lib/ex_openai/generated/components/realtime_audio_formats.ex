defmodule ExOpenAI.Components.RealtimeAudioFormats do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RealtimeAudioFormats.

  ## Type

  `{:%{}, [], [{{:optional, [], [:rate]}, {:integer, [], []}}, {{:optional, [], [:type]}, :"audio/pcm"}]} | {:%{}, [], [{{:optional, [], [:type]}, :"audio/pcmu"}]} | {:%{}, [], [{{:optional, [], [:type]}, :"audio/pcma"}]}`
  """
  @type t() ::
          (%{optional(:rate) => integer(), optional(:type) => :"audio/pcm"}
           | %{optional(:type) => :"audio/pcmu"})
          | %{optional(:type) => :"audio/pcma"}
end
