defmodule ExOpenAI.Components.AuditLogActorServiceAccount do
  use ExOpenAI.Jason

  @moduledoc """
  The service account that performed the audit logged action.

  ## Fields

  * `:id` - **optional** - `String.t()`  
    The service account id.
  """
  @type t() :: %{__struct__: __MODULE__, id: String.t() | nil}
  defstruct [:id]
end
