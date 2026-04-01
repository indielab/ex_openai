defmodule ExOpenAI.Components.RateLimitsParam do
  use ExOpenAI.Jason

  @moduledoc """
  Controls request rate limits for the session.

  ## Fields

  * `:max_requests_per_1_minute` - **optional** - `integer()`  
    Maximum number of requests allowed per minute for the session. Defaults to 10.  
    Constraints: minimum: 1
  """
  @type t() :: %{__struct__: __MODULE__, max_requests_per_1_minute: integer() | nil}
  defstruct [:max_requests_per_1_minute]
end
