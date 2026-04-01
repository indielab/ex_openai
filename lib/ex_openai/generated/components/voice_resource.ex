defmodule ExOpenAI.Components.VoiceResource do
  use ExOpenAI.Jason

  @moduledoc """
  A custom voice that can be used for audio output.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the voice was created.

  * `:id` - **required** - `String.t()`  
    The voice identifier, which can be referenced in API endpoints.

  * `:name` - **required** - `String.t()`  
    The name of the voice.

  * `:object` - **required** - `:"audio.voice"`  
    The object type, which is always `audio.voice`.  
    Allowed values: `"audio.voice"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"audio.voice"
        }
  defstruct [:created_at, :id, :name, :object]
end
