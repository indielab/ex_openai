defmodule ExOpenAI.Components.ResponseAudioDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the audio response is complete.

  ## Fields

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of the delta.

  * `:type` - **required** - `:"response.audio.done"`  
    The type of the event. Always `response.audio.done`.  
    Allowed values: `"response.audio.done"`
  """
  @type t() :: %{__struct__: __MODULE__, sequence_number: integer(), type: :"response.audio.done"}
  defstruct [:sequence_number, :type]
end
