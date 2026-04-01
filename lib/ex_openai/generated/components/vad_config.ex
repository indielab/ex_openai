defmodule ExOpenAI.Components.VadConfig do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VadConfig.

  ## Fields

  * `:prefix_padding_ms` - **optional** - `integer()`  
    Amount of audio to include before the VAD detected speech (in 
  milliseconds).  
    Default: `300`

  * `:silence_duration_ms` - **optional** - `integer()`  
    Duration of silence to detect speech stop (in milliseconds).
  With shorter values the model will respond more quickly, 
  but may jump in on short pauses from the user.  
    Default: `200`

  * `:threshold` - **optional** - `number()`  
    Sensitivity threshold (0.0 to 1.0) for voice activity detection. A 
  higher threshold will require louder audio to activate the model, and 
  thus might perform better in noisy environments.  
    Default: `0.5`

  * `:type` - **required** - `:server_vad`  
    Must be set to `server_vad` to enable manual chunking using server side VAD.  
    Allowed values: `"server_vad"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          prefix_padding_ms: integer() | nil,
          silence_duration_ms: integer() | nil,
          threshold: number() | nil,
          type: :server_vad
        }
  defstruct [:prefix_padding_ms, :silence_duration_ms, :threshold, :type]
end
