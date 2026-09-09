defmodule ExOpenAI.Components.CreateSpeechRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateSpeechRequest.

  ## Fields

  * `:input` - **required** - `String.t()`
    The text to generate audio for. The maximum length is 4096 characters.
    Constraints: maxLength: 4096

  * `:instructions` - **optional** - `String.t()`
    Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
    Constraints: maxLength: 4096

  * `:model` - **required** - `String.t() | :"tts-1" | :"tts-1-hd" | :"gpt-4o-mini-tts" | :"gpt-4o-mini-tts-2025-12-15"`
    One of the available [TTS models](https://platform.openai.com/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.

  * `:response_format` - **optional** - `:mp3 | :opus | :aac | :flac | :wav | :pcm`
    The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
    Allowed values: `"mp3"`, `"opus"`, `"aac"`, `"flac"`, `"wav"`, `"pcm"`
    Default: `"mp3"`

  * `:speed` - **optional** - `number()`
    The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
    Default: `1`
    Constraints: minimum: 0.25, maximum: 4

  * `:stream_format` - **optional** - `:sse | :audio`
    The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.
    Allowed values: `"sse"`, `"audio"`
    Default: `"audio"`

  * `:voice` - **required** - `ExOpenAI.Components.VoiceIdsOrCustomVoice.t()`
    The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the voices are available in the [Text to speech guide](https://platform.openai.com/docs/guides/text-to-speech#voice-options).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: String.t(),
          instructions: String.t() | nil,
          model:
            String.t()
            | ((:"tts-1" | :"tts-1-hd") | :"gpt-4o-mini-tts")
            | :"gpt-4o-mini-tts-2025-12-15",
          response_format: (((((:mp3 | :opus) | :aac) | :flac) | :wav) | :pcm) | nil,
          speed: number() | nil,
          stream_format: (:sse | :audio) | nil,
          voice: ExOpenAI.Components.VoiceIdsOrCustomVoice.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) => String.t(),
              optional(:instructions) => String.t(),
              required(:model) =>
                String.t()
                | (((:"tts-1" | :"tts-1-hd") | :"gpt-4o-mini-tts")
                   | :"gpt-4o-mini-tts-2025-12-15")
                | String.t(),
              optional(:response_format) =>
                (((((:mp3 | :opus) | :aac) | :flac) | :wav) | :pcm) | String.t(),
              optional(:speed) => number(),
              optional(:stream_format) => (:sse | :audio) | String.t(),
              required(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.input()
            }
  defstruct [:input, :instructions, :model, :response_format, :speed, :stream_format, :voice]
end
