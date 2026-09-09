defmodule ExOpenAI.Components.RealtimeCallReferRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters required to transfer a SIP call to a new destination using the
  Realtime API.

  ## Fields

  * `:target_uri` - **required** - `String.t()`
    URI that should appear in the SIP Refer-To header. Supports values like
  `tel:+14155550123` or `sip:agent@example.com`.
  """
  @type t() :: %{__struct__: __MODULE__, target_uri: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:target_uri) => String.t()}
  defstruct [:target_uri]
end
