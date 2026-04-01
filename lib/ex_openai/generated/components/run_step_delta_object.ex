defmodule ExOpenAI.Components.RunStepDeltaObject do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a run step delta i.e. any changed fields on a run step during streaming.


  ## Fields

  * `:delta` - **required** - `{:%{}, [], [{{:optional, [], [:step_details]}, {:map, [], []}}]}`  
    The delta containing the fields that have changed on the run step.

  * `:id` - **required** - `String.t()`  
    The identifier of the run step, which can be referenced in API endpoints.

  * `:object` - **required** - `:"thread.run.step.delta"`  
    The object type, which is always `thread.run.step.delta`.  
    Allowed values: `"thread.run.step.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: %{optional(:step_details) => map()},
          id: String.t(),
          object: :"thread.run.step.delta"
        }
  defstruct [:delta, :id, :object]
end
