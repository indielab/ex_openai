defmodule ExOpenAI.Components.RealtimeBetaServerEventRateLimitsUpdated do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted at the beginning of a Response to indicate the updated rate limits. 
  When a Response is created some tokens will be "reserved" for the output 
  tokens, the rate limits shown here reflect that reservation, which is then 
  adjusted accordingly once the Response is completed.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:rate_limits` - **required** - `[{:%{}, [], [{{:optional, [], [:limit]}, {:integer, [], []}}, {{:optional, [], [:name]}, {:|, [], [:requests, :tokens]}}, {{:optional, [], [:remaining]}, {:integer, [], []}}, {{:optional, [], [:reset_seconds]}, {:number, [], []}}]}]`  
    List of rate limit information.

  * `:type` - **required** - `:"rate_limits.updated"`  
    The event type, must be `rate_limits.updated`.  
    Allowed values: `"rate_limits.updated"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          rate_limits:
            list(%{
              optional(:limit) => integer(),
              optional(:name) => :requests | :tokens,
              optional(:remaining) => integer(),
              optional(:reset_seconds) => number()
            }),
          type: :"rate_limits.updated"
        }
  defstruct [:event_id, :rate_limits, :type]
end
