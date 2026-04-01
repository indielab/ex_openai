defmodule ExOpenAI.Components.TranscriptTextUsageDuration do
  use ExOpenAI.Jason

  @moduledoc """
  Usage statistics for models billed by audio input duration.

  ## Fields

  * `:seconds` - **required** - `number()`  
    Duration of the input audio in seconds.

  * `:type` - **required** - `:duration`  
    The type of the usage object. Always `duration` for this variant.  
    Allowed values: `"duration"`
  """
  @type t() :: %{__struct__: __MODULE__, seconds: number(), type: :duration}
  defstruct [:seconds, :type]
end
