defmodule ExOpenAI.Components.ImageEditStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ImageEditStreamEvent.

  ## Type

  `ExOpenAI.Components.ImageEditPartialImageEvent.t() | ExOpenAI.Components.ImageEditCompletedEvent.t()`
  """
  @type t() ::
          ExOpenAI.Components.ImageEditPartialImageEvent.t()
          | ExOpenAI.Components.ImageEditCompletedEvent.t()
end
