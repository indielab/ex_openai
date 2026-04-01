defmodule ExOpenAI.Components.TaskGroupTask do
  use ExOpenAI.Jason

  @moduledoc """
  Task entry that appears within a TaskGroup.

  ## Fields

  * `:heading` - **required** - `String.t() | any()`

  * `:summary` - **required** - `String.t() | any()`

  * `:type` - **required** - `ExOpenAI.Components.TaskType.t()`  
    Subtype for the grouped task.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          heading: String.t() | any(),
          summary: String.t() | any(),
          type: ExOpenAI.Components.TaskType.t()
        }
  defstruct [:heading, :summary, :type]
end
