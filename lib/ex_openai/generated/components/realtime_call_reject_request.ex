defmodule ExOpenAI.Components.RealtimeCallRejectRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters used to decline an incoming SIP call handled by the Realtime API.

  ## Fields

  * `:status_code` - **optional** - `integer()`  
    SIP response code to send back to the caller. Defaults to `603` (Decline)
  when omitted.
  """
  @type t() :: %{__struct__: __MODULE__, status_code: integer() | nil}
  defstruct [:status_code]
end
