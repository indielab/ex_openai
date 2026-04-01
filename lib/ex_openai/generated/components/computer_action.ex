defmodule ExOpenAI.Components.ComputerAction do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ComputerAction.

  ## Type

  `ExOpenAI.Components.ClickParam.t() | ExOpenAI.Components.DoubleClickAction.t() | ExOpenAI.Components.DragParam.t() | ExOpenAI.Components.KeyPressAction.t() | ExOpenAI.Components.MoveParam.t() | ExOpenAI.Components.ScreenshotParam.t() | ExOpenAI.Components.ScrollParam.t() | ExOpenAI.Components.TypeParam.t() | ExOpenAI.Components.WaitParam.t()`
  """
  @type t() ::
          (((((((ExOpenAI.Components.ClickParam.t() | ExOpenAI.Components.DoubleClickAction.t())
                | ExOpenAI.Components.DragParam.t())
               | ExOpenAI.Components.KeyPressAction.t())
              | ExOpenAI.Components.MoveParam.t())
             | ExOpenAI.Components.ScreenshotParam.t())
            | ExOpenAI.Components.ScrollParam.t())
           | ExOpenAI.Components.TypeParam.t())
          | ExOpenAI.Components.WaitParam.t()
end
