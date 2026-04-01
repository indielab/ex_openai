defmodule ExOpenAI.Components.RunStreamEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStreamEvent.

  ## Type

  `{:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.created"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.queued"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.in_progress"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.requires_action"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.completed"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.incomplete"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.failed"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.cancelling"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.cancelled"}]} | {:%{}, [], [{{:required, [], [:data]}, {{:., [], [ExOpenAI.Components.RunObject, :t]}, [], []}}, {{:required, [], [:event]}, :"thread.run.expired"}]}`
  """
  @type t() ::
          ((((((((%{
                    required(:data) => ExOpenAI.Components.RunObject.t(),
                    required(:event) => :"thread.run.created"
                  }
                  | %{
                      required(:data) => ExOpenAI.Components.RunObject.t(),
                      required(:event) => :"thread.run.queued"
                    })
                 | %{
                     required(:data) => ExOpenAI.Components.RunObject.t(),
                     required(:event) => :"thread.run.in_progress"
                   })
                | %{
                    required(:data) => ExOpenAI.Components.RunObject.t(),
                    required(:event) => :"thread.run.requires_action"
                  })
               | %{
                   required(:data) => ExOpenAI.Components.RunObject.t(),
                   required(:event) => :"thread.run.completed"
                 })
              | %{
                  required(:data) => ExOpenAI.Components.RunObject.t(),
                  required(:event) => :"thread.run.incomplete"
                })
             | %{
                 required(:data) => ExOpenAI.Components.RunObject.t(),
                 required(:event) => :"thread.run.failed"
               })
            | %{
                required(:data) => ExOpenAI.Components.RunObject.t(),
                required(:event) => :"thread.run.cancelling"
              })
           | %{
               required(:data) => ExOpenAI.Components.RunObject.t(),
               required(:event) => :"thread.run.cancelled"
             })
          | %{
              required(:data) => ExOpenAI.Components.RunObject.t(),
              required(:event) => :"thread.run.expired"
            }
end
