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
  defstruct [:email, :id]
end
