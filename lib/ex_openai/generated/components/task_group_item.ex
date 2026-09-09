defmodule ExOpenAI.Components.TaskGroupItem do
  use ExOpenAI.Jason

  @moduledoc """
  Collection of workflow tasks grouped together in the thread.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) for when the item was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Identifier of the thread item.

  * `:object` - **required** - `:"chatkit.thread_item"`
    Type discriminator that is always `chatkit.thread_item`.
    Allowed values: `"chatkit.thread_item"`
    Default: `"chatkit.thread_item"`

  * `:tasks` - **required** - `list(ExOpenAI.Components.TaskGroupTask.t())`
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:object) => :"chatkit.thread_item" | String.t(),
              required(:tasks) => list(ExOpenAI.Components.TaskGroupTask.input()),
              required(:thread_id) => String.t(),
              required(:type) => :"chatkit.task_group" | String.t()
            }
  defstruct [:created_at, :id, :object, :tasks, :thread_id, :type]
end
