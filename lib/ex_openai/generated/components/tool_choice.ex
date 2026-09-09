defmodule ExOpenAI.Components.ToolChoice do
  use ExOpenAI.Jason

  @moduledoc """
  Tool selection that the assistant should honor when executing the item.

  ## Fields

  * `:id` - **required** - `String.t()`
    Identifier of the requested tool.
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:id) => String.t()}
  defstruct [:id]
end
