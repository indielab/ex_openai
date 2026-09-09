defmodule ExOpenAI.Components.AuditLogActorUser do
  use ExOpenAI.Jason

  @moduledoc """
  The user who performed the audit logged action.

  ## Fields

  * `:email` - **optional** - `String.t()`
    The user email.

  * `:id` - **optional** - `String.t()`
    The user id.
  """
  @type t() :: %{__struct__: __MODULE__, email: String.t() | nil, id: String.t() | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{optional(:email) => String.t(), optional(:id) => String.t()}
  defstruct [:email, :id]
end
