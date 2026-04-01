defmodule ExOpenAI.Components.ChatSessionRateLimits do
  use ExOpenAI.Jason

  @moduledoc """
  Active per-minute request limit for the session.

  ## Fields

  * `:max_requests_per_1_minute` - **required** - `integer()`  
    Maximum allowed requests per one-minute window.
  """
  @type t() :: %{__struct__: __MODULE__, max_requests_per_1_minute: integer()}
  defstruct [:max_requests_per_1_minute]
end
