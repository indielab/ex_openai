defmodule ExOpenAI.Components.InputItem do
  @moduledoc """
  Module for representing the OpenAI schema InputItem.

  ## Type

  `ExOpenAI.Components.EasyInputMessage.t() | map() | ExOpenAI.Components.CompactionTriggerItemParam.t() | ExOpenAI.Components.ItemReferenceParam.t() | ExOpenAI.Components.ProgramItemParam.t() | ExOpenAI.Components.ProgramOutputItemParam.t()`
  """
  @type t() ::
          ((((ExOpenAI.Components.EasyInputMessage.t() | map())
             | ExOpenAI.Components.CompactionTriggerItemParam.t())
            | ExOpenAI.Components.ItemReferenceParam.t())
           | ExOpenAI.Components.ProgramItemParam.t())
          | ExOpenAI.Components.ProgramOutputItemParam.t()
  @type input() ::
          ((((ExOpenAI.Components.EasyInputMessage.input() | ExOpenAI.Components.Item.input())
             | ExOpenAI.Components.CompactionTriggerItemParam.input())
            | ExOpenAI.Components.ItemReferenceParam.input())
           | ExOpenAI.Components.ProgramItemParam.input())
          | ExOpenAI.Components.ProgramOutputItemParam.input()
end
