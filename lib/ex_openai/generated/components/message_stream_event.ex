defmodule ExOpenAI.Components.MessageStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema MessageStreamEvent.

  ## Type

  `{:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.MessageObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.message.created"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.MessageObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.message.in_progress"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.MessageDeltaObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.message.delta"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.MessageObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.message.completed"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.MessageObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.message.incomplete"}]}`
  """
  @type t() ::
          (((%{
               required(:data) => ExOpenAI.Components.MessageObject.t(),
               required(:event) => :"thread.message.created"
             }
             | %{
                 required(:data) => ExOpenAI.Components.MessageObject.t(),
                 required(:event) => :"thread.message.in_progress"
               })
            | %{
                required(:data) => ExOpenAI.Components.MessageDeltaObject.t(),
                required(:event) => :"thread.message.delta"
              })
           | %{
               required(:data) => ExOpenAI.Components.MessageObject.t(),
               required(:event) => :"thread.message.completed"
             })
          | %{
              required(:data) => ExOpenAI.Components.MessageObject.t(),
              required(:event) => :"thread.message.incomplete"
            }
end
