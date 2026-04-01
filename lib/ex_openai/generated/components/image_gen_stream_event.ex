defmodule ExOpenAI.Components.ImageGenStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ImageGenStreamEvent.

  ## Type

  `ExOpenAI.Components.ImageGenPartialImageEvent.t() | ExOpenAI.Components.ImageGenCompletedEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.ImageGenPartialImageEvent.t()
          | ExOpenAI.Components.ImageGenCompletedEvent.t()
end
