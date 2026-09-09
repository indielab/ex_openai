defmodule ExOpenAI.Components.ThreadItem do
  @moduledoc """
  Module for representing the OpenAI schema ThreadItem.

  ## Type

  `ExOpenAI.Components.UserMessageItem.t() | ExOpenAI.Components.AssistantMessageItem.t() | ExOpenAI.Components.WidgetMessageItem.t() | ExOpenAI.Components.ClientToolCallItem.t() | ExOpenAI.Components.TaskItem.t() | ExOpenAI.Components.TaskGroupItem.t()`
  """
  @type t() ::
          ((((ExOpenAI.Components.UserMessageItem.t()
              | ExOpenAI.Components.AssistantMessageItem.t())
             | ExOpenAI.Components.WidgetMessageItem.t())
            | ExOpenAI.Components.ClientToolCallItem.t())
           | ExOpenAI.Components.TaskItem.t())
          | ExOpenAI.Components.TaskGroupItem.t()
  @type input() ::
          ((((ExOpenAI.Components.UserMessageItem.input()
              | ExOpenAI.Components.AssistantMessageItem.input())
             | ExOpenAI.Components.WidgetMessageItem.input())
            | ExOpenAI.Components.ClientToolCallItem.input())
           | ExOpenAI.Components.TaskItem.input())
          | ExOpenAI.Components.TaskGroupItem.input()
end
