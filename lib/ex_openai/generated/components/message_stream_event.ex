defmodule ExOpenAI.Components.MessageStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema MessageStreamEvent.

  ## Type

  `%{ required(:data) => ExOpenAI.Components.MessageObject.t(), required(:event) => :"thread.message.created" } | %{ required(:data) => ExOpenAI.Components.MessageObject.t(), required(:event) => :"thread.message.in_progress" } | %{ required(:data) => ExOpenAI.Components.MessageDeltaObject.t(), required(:event) => :"thread.message.delta" } | %{ required(:data) => ExOpenAI.Components.MessageObject.t(), required(:event) => :"thread.message.completed" } | %{ required(:data) => ExOpenAI.Components.MessageObject.t(), required(:event) => :"thread.message.incomplete" }`
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
  @type input() ::
          (((%{
               required(:data) => ExOpenAI.Components.MessageObject.input(),
               required(:event) => :"thread.message.created" | String.t()
             }
             | %{
                 required(:data) => ExOpenAI.Components.MessageObject.input(),
                 required(:event) => :"thread.message.in_progress" | String.t()
               })
            | %{
                required(:data) => ExOpenAI.Components.MessageDeltaObject.input(),
                required(:event) => :"thread.message.delta" | String.t()
              })
           | %{
               required(:data) => ExOpenAI.Components.MessageObject.input(),
               required(:event) => :"thread.message.completed" | String.t()
             })
          | %{
              required(:data) => ExOpenAI.Components.MessageObject.input(),
              required(:event) => :"thread.message.incomplete" | String.t()
            }
end
