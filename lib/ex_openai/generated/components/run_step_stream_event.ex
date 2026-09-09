defmodule ExOpenAI.Components.RunStepStreamEvent do
  @moduledoc """
  Module for representing the OpenAI schema RunStepStreamEvent.

  ## Type

  `%{ required(:data) => ExOpenAI.Components.RunStepObject.t(), required(:event) => :"thread.run.step.created" } | %{ required(:data) => ExOpenAI.Components.RunStepObject.t(), required(:event) => :"thread.run.step.in_progress" } | %{ required(:data) => ExOpenAI.Components.RunStepDeltaObject.t(), required(:event) => :"thread.run.step.delta" } | %{ required(:data) => ExOpenAI.Components.RunStepObject.t(), required(:event) => :"thread.run.step.completed" } | %{ required(:data) => ExOpenAI.Components.RunStepObject.t(), required(:event) => :"thread.run.step.failed" } | %{ required(:data) => ExOpenAI.Components.RunStepObject.t(), required(:event) => :"thread.run.step.cancelled" } | %{ required(:data) => ExOpenAI.Components.RunStepObject.t(), required(:event) => :"thread.run.step.expired" }`
  """
  @type t() ::
          (((((%{
                 required(:data) => ExOpenAI.Components.RunStepObject.t(),
                 required(:event) => :"thread.run.step.created"
               }
               | %{
                   required(:data) => ExOpenAI.Components.RunStepObject.t(),
                   required(:event) => :"thread.run.step.in_progress"
                 })
              | %{
                  required(:data) => ExOpenAI.Components.RunStepDeltaObject.t(),
                  required(:event) => :"thread.run.step.delta"
                })
             | %{
                 required(:data) => ExOpenAI.Components.RunStepObject.t(),
                 required(:event) => :"thread.run.step.completed"
               })
            | %{
                required(:data) => ExOpenAI.Components.RunStepObject.t(),
                required(:event) => :"thread.run.step.failed"
              })
           | %{
               required(:data) => ExOpenAI.Components.RunStepObject.t(),
               required(:event) => :"thread.run.step.cancelled"
             })
          | %{
              required(:data) => ExOpenAI.Components.RunStepObject.t(),
              required(:event) => :"thread.run.step.expired"
            }
  @type input() ::
          (((((%{
                 required(:data) => ExOpenAI.Components.RunStepObject.input(),
                 required(:event) => :"thread.run.step.created" | String.t()
               }
               | %{
                   required(:data) => ExOpenAI.Components.RunStepObject.input(),
                   required(:event) => :"thread.run.step.in_progress" | String.t()
                 })
              | %{
                  required(:data) => ExOpenAI.Components.RunStepDeltaObject.input(),
                  required(:event) => :"thread.run.step.delta" | String.t()
                })
             | %{
                 required(:data) => ExOpenAI.Components.RunStepObject.input(),
                 required(:event) => :"thread.run.step.completed" | String.t()
               })
            | %{
                required(:data) => ExOpenAI.Components.RunStepObject.input(),
                required(:event) => :"thread.run.step.failed" | String.t()
              })
           | %{
               required(:data) => ExOpenAI.Components.RunStepObject.input(),
               required(:event) => :"thread.run.step.cancelled" | String.t()
             })
          | %{
              required(:data) => ExOpenAI.Components.RunStepObject.input(),
              required(:event) => :"thread.run.step.expired" | String.t()
            }
end
