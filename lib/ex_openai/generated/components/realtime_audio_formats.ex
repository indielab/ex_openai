defmodule ExOpenAI.Components.RealtimeAudioFormats do
  @moduledoc """
  Module for representing the OpenAI schema RealtimeAudioFormats.

  ## Type

  `%{optional(:rate) => integer(), optional(:type) => :"audio/pcm"} | %{optional(:type) => :"audio/pcmu"} | %{optional(:type) => :"audio/pcma"}`
  """
  @type t() ::
          (%{optional(:rate) => integer(), optional(:type) => :"audio/pcm"}
           | %{optional(:type) => :"audio/pcmu"})
          | %{optional(:type) => :"audio/pcma"}
  @type input() ::
          (%{optional(:rate) => integer(), optional(:type) => :"audio/pcm" | String.t()}
           | %{optional(:type) => :"audio/pcmu" | String.t()})
          | %{optional(:type) => :"audio/pcma" | String.t()}
end
