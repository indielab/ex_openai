defmodule ExOpenAI.Components.TaskGroupTask do
  use ExOpenAI.Jason

  @moduledoc """
  Task entry that appears within a TaskGroup.

  ## Fields

  * `:heading` - **required** - `String.t() | nil`

  * `:summary` - **required** - `String.t() | nil`

  * `:type` - **required** - `ExOpenAI.Components.TaskType.t()`
    Subtype for the grouped task.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          heading: String.t() | nil,
          summary: String.t() | nil,
          type: ExOpenAI.Components.TaskType.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:heading) => String.t() | nil,
              required(:summary) => String.t() | nil,
              required(:type) => ExOpenAI.Components.TaskType.input()
            }
  defstruct [:heading, :summary, :type]
end
