defmodule ExOpenAI.Components.BetaComputerAction do
  @moduledoc """
  Module for representing the OpenAI schema BetaComputerAction.

  ## Type

  `ExOpenAI.Components.BetaClickParam.t() | ExOpenAI.Components.BetaDoubleClickAction.t() | ExOpenAI.Components.BetaDragParam.t() | ExOpenAI.Components.BetaKeyPressAction.t() | ExOpenAI.Components.BetaMoveParam.t() | ExOpenAI.Components.BetaScreenshotParam.t() | ExOpenAI.Components.BetaScrollParam.t() | ExOpenAI.Components.BetaTypeParam.t() | ExOpenAI.Components.BetaWaitParam.t()`
  """
  @type t() ::
          (((((((ExOpenAI.Components.BetaClickParam.t()
                 | ExOpenAI.Components.BetaDoubleClickAction.t())
                | ExOpenAI.Components.BetaDragParam.t())
               | ExOpenAI.Components.BetaKeyPressAction.t())
              | ExOpenAI.Components.BetaMoveParam.t())
             | ExOpenAI.Components.BetaScreenshotParam.t())
            | ExOpenAI.Components.BetaScrollParam.t())
           | ExOpenAI.Components.BetaTypeParam.t())
          | ExOpenAI.Components.BetaWaitParam.t()
  @type input() ::
          (((((((ExOpenAI.Components.BetaClickParam.input()
                 | ExOpenAI.Components.BetaDoubleClickAction.input())
                | ExOpenAI.Components.BetaDragParam.input())
               | ExOpenAI.Components.BetaKeyPressAction.input())
              | ExOpenAI.Components.BetaMoveParam.input())
             | ExOpenAI.Components.BetaScreenshotParam.input())
            | ExOpenAI.Components.BetaScrollParam.input())
           | ExOpenAI.Components.BetaTypeParam.input())
          | ExOpenAI.Components.BetaWaitParam.input()
end
