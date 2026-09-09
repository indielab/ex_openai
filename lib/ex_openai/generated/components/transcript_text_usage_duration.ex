defmodule ExOpenAI.Components.TranscriptTextUsageDuration do
  use ExOpenAI.Jason

  @moduledoc """
  Usage statistics for models billed by audio input duration.

  ## Fields

  * `:seconds` - **required** - `number()`
    Duration of the input audio in seconds.
    Format: `double`

  * `:type` - **required** - `:duration`
    The type of the usage object. Always `duration` for this variant.
    Allowed values: `"duration"`
  """
  @type t() :: %{__struct__: __MODULE__, seconds: number(), type: :duration}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:seconds) => number(), required(:type) => :duration | String.t()}
  defstruct [:seconds, :type]
end
