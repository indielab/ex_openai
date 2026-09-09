defmodule ExOpenAI.Components.ImageEditStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema ImageEditStreamEvent.

  ## Type

  `ExOpenAI.Components.ImageEditPartialImageEvent.t() | ExOpenAI.Components.ImageEditCompletedEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.ImageEditPartialImageEvent.t()
          | ExOpenAI.Components.ImageEditCompletedEvent.t()
  @type input() ::
          ExOpenAI.Components.ImageEditPartialImageEvent.input()
          | ExOpenAI.Components.ImageEditCompletedEvent.input()
end
