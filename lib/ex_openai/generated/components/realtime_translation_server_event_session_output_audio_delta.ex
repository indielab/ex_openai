defmodule ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputAudioDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when translated output audio is available. Output audio deltas are
  200 ms frames of PCM16 audio.


  ## Fields

  * `:channels` - **optional** - `integer()`
    Number of audio channels.
    Default: `1`

  * `:delta` - **required** - `String.t()`
    Base64-encoded translated audio data.

  * `:elapsed_ms` - **optional** - `integer() | nil`

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:format` - **optional** - `:pcm16`
    Audio encoding for `delta`.
    Allowed values: `"pcm16"`

  * `:sample_rate` - **optional** - `integer()`
    Sample rate of the audio delta.
    Default: `24000`

  * `:type` - **required** - `:"session.output_audio.delta"`
    The event type, must be `session.output_audio.delta`.
    Allowed values: `"session.output_audio.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          channels: integer() | nil,
          delta: String.t(),
          elapsed_ms: (integer() | nil) | nil,
          event_id: String.t(),
          format: :pcm16 | nil,
          sample_rate: integer() | nil,
          type: :"session.output_audio.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:channels) => integer(),
              required(:delta) => String.t(),
              optional(:elapsed_ms) => integer() | nil,
              required(:event_id) => String.t(),
              optional(:format) => :pcm16 | String.t(),
              optional(:sample_rate) => integer(),
              required(:type) => :"session.output_audio.delta" | String.t()
            }
  defstruct [:channels, :delta, :elapsed_ms, :event_id, :format, :sample_rate, :type]
end
