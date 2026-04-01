defmodule ExOpenAI.Components.TaskItem do
  use ExOpenAI.Jason

  @moduledoc """
  Task emitted by the workflow to show progress and status updates.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) for when the item was created.

  * `:heading` - **required** - `String.t() | any()`

  * `:id` - **required** - `String.t()`  
    Identifier of the thread item.

  * `:object` - **required** - `:"chatkit.thread_item"`  
    Type discriminator that is always `chatkit.thread_item`.  
    Allowed values: `"chatkit.thread_item"`  
    Default: `"chatkit.thread_item"`

  * `:summary` - **required** - `String.t() | any()`

  * `:task_type` - **required** - `ExOpenAI.Components.TaskType.t()`  
    Subtype for the task.

  * `:thread_id` - **required** - `String.t()`  
    Identifier of the parent thread.

  * `:type` - **required** - `:"chatkit.task"`  
    Type discriminator that is always `chatkit.task`.  
    Allowed values: `"chatkit.task"`  
    Default: `"chatkit.task"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          heading: String.t() | any(),
          id: String.t(),
          object: :"chatkit.thread_item",
          summary: String.t() | any(),
          task_type: ExOpenAI.Components.TaskType.t(),
          thread_id: String.t(),
          type: :"chatkit.task"
        }
  defstruct [:created_at, :heading, :id, :object, :summary, :task_type, :thread_id, :type]
end
