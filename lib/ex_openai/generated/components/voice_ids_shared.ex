defmodule ExOpenAI.Components.VoiceIdsShared do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VoiceIdsShared.

  ## Type

  `String.t() | :alloy | :ash | :ballad | :coral | :echo | :sage | :shimmer | :verse | :marin | :cedar`
  """
  @type t() ::
          String.t()
          | ((((((((:alloy | :ash) | :ballad) | :coral) | :echo) | :sage) | :shimmer) | :verse)
             | :marin)
          | :cedar
end
