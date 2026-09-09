defmodule ExOpenAI.Components.CreateGroupBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for creating a new group in the organization.

  ## Fields

  * `:name` - **required** - `String.t()`
    Human readable name for the group.
    Constraints: minLength: 1, maxLength: 255
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:name) => String.t()}
  defstruct [:name]
end
