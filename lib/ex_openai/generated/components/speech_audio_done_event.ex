defmodule ExOpenAI.Components.SpeechAudioDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the speech synthesis is complete and all audio has been streamed.

  ## Fields

  * `:type` - **required** - `:"speech.audio.done"`  
    The type of the event. Always `speech.audio.done`.  
    Allowed values: `"speech.audio.done"`

  * `:usage` - **required** - `{:%{}, [], [{{:required, [], [:input_tokens]}, {:integer, [], []}}, {{:required, [], [:output_tokens]}, {:integer, [], []}}, {{:required, [], [:total_tokens]}, {:integer, [], []}}]}`  
    Token usage statistics for the request.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          type: :"speech.audio.done",
          usage: %{
            required(:input_tokens) => integer(),
            required(:output_tokens) => integer(),
            required(:total_tokens) => integer()
          }
        }
  defstruct [:type, :usage]
end
