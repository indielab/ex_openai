defmodule ExOpenAI.Components.ThreadItem do
  use ExOpenAI.Jason

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
end
