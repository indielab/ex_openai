defmodule ExOpenAI.Components.VectorStoreExpirationAfter do
  use ExOpenAI.Jason

  @moduledoc """
  The expiration policy for a vector store.

  ## Fields

  * `:anchor` - **required** - `:last_active_at`
    Anchor timestamp after which the expiration policy applies. Supported anchors: `last_active_at`.
    Allowed values: `"last_active_at"`

  * `:days` - **required** - `integer()`
    The number of days after the anchor time that the vector store will expire.
    Constraints: minimum: 1, maximum: 365
  """
  @type t() :: %{__struct__: __MODULE__, anchor: :last_active_at, days: integer()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:anchor) => :last_active_at | String.t(), required(:days) => integer()}
  defstruct [:anchor, :days]
end
