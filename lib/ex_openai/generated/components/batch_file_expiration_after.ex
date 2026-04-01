defmodule ExOpenAI.Components.BatchFileExpirationAfter do
  use ExOpenAI.Jason

  @moduledoc """
  The expiration policy for the output and/or error file that are generated for a batch.

  ## Fields

  * `:anchor` - **required** - `:created_at`  
    Anchor timestamp after which the expiration policy applies. Supported anchors: `created_at`. Note that the anchor is the file creation time, not the time the batch is created.  
    Allowed values: `"created_at"`

  * `:seconds` - **required** - `integer()`  
    The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).  
    Constraints: minimum: 3600, maximum: 2592000
  """
  @type t() :: %{__struct__: __MODULE__, anchor: :created_at, seconds: integer()}
  defstruct [:anchor, :seconds]
end
