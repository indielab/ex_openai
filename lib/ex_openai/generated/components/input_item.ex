defmodule ExOpenAI.Components.InputItem do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema InputItem.

  ## Type

  `ExOpenAI.Components.EasyInputMessage.t() | map() | ExOpenAI.Components.ItemReferenceParam.t()`
  """
  @type t() ::
          (ExOpenAI.Components.EasyInputMessage.t() | map())
          | ExOpenAI.Components.ItemReferenceParam.t()
end
