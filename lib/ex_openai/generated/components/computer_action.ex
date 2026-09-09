defmodule ExOpenAI.Components.ComputerAction do
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
  @type input() ::
          (((((((ExOpenAI.Components.ClickParam.input()
                 | ExOpenAI.Components.DoubleClickAction.input())
                | ExOpenAI.Components.DragParam.input())
               | ExOpenAI.Components.KeyPressAction.input())
              | ExOpenAI.Components.MoveParam.input())
             | ExOpenAI.Components.ScreenshotParam.input())
            | ExOpenAI.Components.ScrollParam.input())
           | ExOpenAI.Components.TypeParam.input())
          | ExOpenAI.Components.WaitParam.input()
end
