defmodule ExOpenAI.Components.ImageGenStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema ImageGenStreamEvent.

  ## Type

  `ExOpenAI.Components.ImageGenPartialImageEvent.t() | ExOpenAI.Components.ImageGenCompletedEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.ImageGenPartialImageEvent.t()
          | ExOpenAI.Components.ImageGenCompletedEvent.t()
  @type input() ::
          ExOpenAI.Components.ImageGenPartialImageEvent.input()
          | ExOpenAI.Components.ImageGenCompletedEvent.input()
end
