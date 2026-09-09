defmodule ExOpenAI.Components.ClosedStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that a thread has been closed.

  ## Fields

  * `:reason` - **required** - `String.t() | nil`

  * `:type` - **required** - `:closed`
    Status discriminator that is always `closed`.
    Allowed values: `"closed"`
    Default: `"closed"`
  """
  @type t() :: %{__struct__: __MODULE__, reason: String.t() | nil, type: :closed}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:reason) => String.t() | nil, required(:type) => :closed | String.t()}
  defstruct [:reason, :type]
end
