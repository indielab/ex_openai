defmodule ExOpenAI.Components.VideoReferenceInputParam do
  use ExOpenAI.Jason

  @moduledoc """
  Reference to the completed video.

  ## Fields

  * `:id` - **required** - `String.t()`
    The identifier of the completed video.
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:id) => String.t()}
  defstruct [:id]
end
