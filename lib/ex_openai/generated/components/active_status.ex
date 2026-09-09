defmodule ExOpenAI.Components.ActiveStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that a thread is active.

  ## Fields

  * `:type` - **required** - `:active`
    Status discriminator that is always `active`.
    Allowed values: `"active"`
    Default: `"active"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :active}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :active | String.t()}
  defstruct [:type]
end
