defmodule ExOpenAI.Components.TaskGroupItem do
  use ExOpenAI.Jason

  @moduledoc """
  Collection of workflow tasks grouped together in the thread.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) for when the item was created.

  * `:id` - **required** - `String.t()`  
    Identifier of the thread item.

  * `:object` - **required** - `:"chatkit.thread_item"`  
    Type discriminator that is always `chatkit.thread_item`.  
    Allowed values: `"chatkit.thread_item"`  
    Default: `"chatkit.thread_item"`

  * `:tasks` - **required** - `[ExOpenAI.Components.TaskGroupTask.t()]`  
    Tasks included in the group.

  * `:thread_id` - **required** - `String.t()`  
    Identifier of the parent thread.

  * `:type` - **required** - `:"chatkit.task_group"`  
    Type discriminator that is always `chatkit.task_group`.  
    Allowed values: `"chatkit.task_group"`  
    Default: `"chatkit.task_group"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          object: :"chatkit.thread_item",
          tasks: list(ExOpenAI.Components.TaskGroupTask.t()),
          thread_id: String.t(),
          type: :"chatkit.task_group"
        }
  defstruct [:created_at, :id, :object, :tasks, :thread_id, :type]
end
