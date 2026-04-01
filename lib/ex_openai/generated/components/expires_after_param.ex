defmodule ExOpenAI.Components.ExpiresAfterParam do
  use ExOpenAI.Jason

  @moduledoc """
  Controls when the session expires relative to an anchor timestamp.

  ## Fields

  * `:anchor` - **required** - `:created_at`  
    Base timestamp used to calculate expiration. Currently fixed to `created_at`.  
    Allowed values: `"created_at"`  
    Default: `"created_at"`

  * `:seconds` - **required** - `integer()`  
    Number of seconds after the anchor when the session expires.  
    Constraints: minimum: 1, maximum: 600
  """
  @type t() :: %{__struct__: __MODULE__, anchor: :created_at, seconds: integer()}
  defstruct [:anchor, :seconds]
end
