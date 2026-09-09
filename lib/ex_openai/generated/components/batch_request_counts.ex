defmodule ExOpenAI.Components.BatchRequestCounts do
  use ExOpenAI.Jason

  @moduledoc """
  The request counts for different statuses within the batch.

  ## Fields

  * `:completed` - **required** - `integer()`
    Number of requests that have been completed successfully.

  * `:failed` - **required** - `integer()`
    Number of requests that have failed.

  * `:total` - **required** - `integer()`
    Total number of requests in the batch.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          completed: integer(),
          failed: integer(),
          total: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:completed) => integer(),
              required(:failed) => integer(),
              required(:total) => integer()
            }
  defstruct [:completed, :failed, :total]
end
