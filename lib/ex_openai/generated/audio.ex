defmodule ExOpenAI.Audio do
  @moduledoc false
  (
    @doc """
    Generates audio from the input text.

    Returns the audio file content, or a stream of audio events.


    ## Parameters

    * `input` - **required** - `String.t()`  
      The text to generate audio for. The maximum length is 4096 characters.  
      Constraints: maxLength: 4096

    * `model` - **required** - `String.t() | :"tts-1" | :"tts-1-hd" | :"gpt-4o-mini-tts" | :"gpt-4o-mini-tts-2025-12-15"`  
      One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.

    * `voice` - **required** - `any()`  
      The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the voices are available in the [Text to speech guide](/docs/guides/text-to-speech#voice-options).

    ## Options

    * `instructions` - **optional** - `String.t()`  
      Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.  
      Constraints: maxLength: 4096

    * `response_format` - **optional** - `:mp3 | :opus | :aac | :flac | :wav | :pcm`  
      The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.  
      Allowed values: `"mp3"`, `"opus"`, `"aac"`, `"flac"`, `"wav"`, `"pcm"`  
      Default: `"mp3"`

    * `speed` - **optional** - `number()`  
      The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.  
      Default: `1`  
      Constraints: minimum: 0.25, maximum: 4

    * `stream_format` - **optional** - `:sse | :audio`  
      The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.  
      Allowed values: `"sse"`, `"audio"`  
      Default: `"audio"`
    """
    (
      @type create_speech_opt() ::
              (({:instructions, String.t()}
                | {:response_format, ((((:mp3 | :opus) | :aac) | :flac) | :wav) | :pcm})
               | {:speed, number()})
              | {:stream_format, :sse | :audio}
      @spec create_speech(
              input :: String.t(),
              model ::
                String.t()
                | ((:"tts-1" | :"tts-1-hd") | :"gpt-4o-mini-tts")
                | :"gpt-4o-mini-tts-2025-12-15",
              voice :: ExOpenAI.Components.VoiceIdsOrCustomVoice.t(),
              opts :: [create_speech_opt()]
            ) :: {:ok, map()} | {:error, any()}
    )

    def create_speech(input, model, voice, opts \\ []) do
      url = "/audio/speech"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [input: input, model: model, voice: voice]

      optional_body_params =
        Keyword.take(opts, [:instructions, :response_format, :speed, :stream_format])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:instructions, :response_format, :speed, :stream_format] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(response, nil)
      end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Transcribes audio into the input language.

    Returns a transcription object in `json`, `diarized_json`, or `verbose_json`
    format, or a stream of transcript events.


    ## Parameters

    * `file` - **required** - `binary()`  
      The audio file object (not file name) to transcribe, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.  
      Format: `binary`

    * `model` - **required** - `String.t() | :"whisper-1" | :"gpt-4o-transcribe" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | :"gpt-4o-transcribe-diarize"`  
      ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `whisper-1` (which is powered by our open source Whisper V2 model), and `gpt-4o-transcribe-diarize`.  
      Example: `"gpt-4o-transcribe"`

    ## Options

    * `chunking_strategy` - **optional** - `:auto | any() | any()`

    * `include` - **optional** - `[any()]`  
      Additional information to include in the transcription response.
    `logprobs` will return the log probabilities of the tokens in the
    response to understand the model's confidence in the transcription.
    `logprobs` only works with response_format set to `json` and only with
    the models `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `gpt-4o-mini-transcribe-2025-12-15`. This field is not supported when using `gpt-4o-transcribe-diarize`.

    * `known_speaker_names` - **optional** - `[String.t()]`  
      Optional list of speaker names that correspond to the audio samples provided in `known_speaker_references[]`. Each entry should be a short identifier (for example `customer` or `agent`). Up to 4 speakers are supported.  
      Constraints: maxItems: 4

    * `known_speaker_references` - **optional** - `[String.t()]`  
      Optional list of audio samples (as [data URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs)) that contain known speaker references matching `known_speaker_names[]`. Each sample must be between 2 and 10 seconds, and can use any of the same input audio formats supported by `file`.  
      Constraints: maxItems: 4

    * `language` - **optional** - `String.t()`  
      The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format will improve accuracy and latency.

    * `prompt` - **optional** - `String.t()`  
      An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text#prompting) should match the audio language. This field is not supported when using `gpt-4o-transcribe-diarize`.

    * `response_format` - **optional** - `any()`

    * `stream` - **optional** - `boolean() | any()`

    * `temperature` - **optional** - `number()`  
      The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.  
      Default: `0`

    * `timestamp_granularities` - **optional** - `[:word | :segment]`  
      The timestamp granularities to populate for this transcription. `response_format` must be set `verbose_json` to use timestamp granularities. Either or both of these options are supported: `word`, or `segment`. Note: There is no additional latency for segment timestamps, but generating word timestamps incurs additional latency.
    This option is not available for `gpt-4o-transcribe-diarize`.  
      Default: `["segment"]`
    """
    (
      @type create_transcription_opt() ::
              (((((((({:chunking_strategy, (:auto | ExOpenAI.Components.VadConfig.t()) | any()}
                      | {:include, list(ExOpenAI.Components.TranscriptionInclude.t())})
                     | {:known_speaker_names, list(String.t())})
                    | {:known_speaker_references, list(String.t())})
                   | {:language, String.t()})
                  | {:prompt, String.t()})
                 | {:response_format, ExOpenAI.Components.AudioResponseFormat.t()})
                | {:stream, boolean() | any()})
               | {:temperature, number()})
              | {:timestamp_granularities, list(:word | :segment)}
      @spec create_transcription(
              file :: binary(),
              model ::
                String.t()
                | (((:"whisper-1" | :"gpt-4o-transcribe") | :"gpt-4o-mini-transcribe")
                   | :"gpt-4o-mini-transcribe-2025-12-15")
                | :"gpt-4o-transcribe-diarize",
              opts :: [create_transcription_opt()]
            ) :: {:ok, map() | reference()} | {:error, any()}
    )

    def create_transcription(file, model, opts \\ []) do
      url = "/audio/transcriptions"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [file: file, model: model]

      optional_body_params =
        Keyword.take(opts, [
          :chunking_strategy,
          :include,
          :known_speaker_names,
          :known_speaker_references,
          :language,
          :prompt,
          :response_format,
          :stream,
          :temperature,
          :timestamp_granularities
        ])

      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [
          :chunking_strategy,
          :include,
          :known_speaker_names,
          :known_speaker_references,
          :language,
          :prompt,
          :response_format,
          :stream,
          :temperature,
          :timestamp_granularities
        ]
        |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response =
        if Keyword.get(opts, :stream, false) do
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/CreateTranscriptionResponseStreamEvent"
              }
            )
          end
        else
          fn response ->
            ExOpenAI.Codegen.ResponseConverter.convert_response(
              response,
              %ExOpenAI.Codegen.DocsParser.Schema{
                one_of: [
                  %ExOpenAI.Codegen.DocsParser.Schema{
                    ref: "#/components/schemas/CreateTranscriptionResponseJson"
                  },
                  %ExOpenAI.Codegen.DocsParser.Schema{
                    ref: "#/components/schemas/CreateTranscriptionResponseDiarizedJson"
                  },
                  %ExOpenAI.Codegen.DocsParser.Schema{
                    ref: "#/components/schemas/CreateTranscriptionResponseVerboseJson"
                  }
                ]
              }
            )
          end
        end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Translates audio into English.

    ## Parameters

    * `file` - **required** - `binary()`  
      The audio file object (not file name) translate, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.  
      Format: `binary`

    * `model` - **required** - `String.t() | :"whisper-1"`  
      ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available.  
      Example: `"whisper-1"`

    ## Options

    * `prompt` - **optional** - `String.t()`  
      An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text#prompting) should be in English.

    * `response_format` - **optional** - `:json | :text | :srt | :verbose_json | :vtt`  
      The format of the output, in one of these options: `json`, `text`, `srt`, `verbose_json`, or `vtt`.  
      Allowed values: `"json"`, `"text"`, `"srt"`, `"verbose_json"`, `"vtt"`  
      Default: `"json"`

    * `temperature` - **optional** - `number()`  
      The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.  
      Default: `0`
    """
    (
      @type create_translation_opt() ::
              ({:prompt, String.t()}
               | {:response_format, (((:json | :text) | :srt) | :verbose_json) | :vtt})
              | {:temperature, number()}
      @spec create_translation(
              file :: binary(),
              model :: String.t() | :"whisper-1",
              opts :: [create_translation_opt()]
            ) :: {:ok, map()} | {:error, any()}
    )

    def create_translation(file, model, opts \\ []) do
      url = "/audio/translations"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [file: file, model: model]
      optional_body_params = Keyword.take(opts, [:prompt, :response_format, :temperature])
      body_params = body_params ++ optional_body_params

      optional_params_to_drop =
        [:prompt, :response_format, :temperature] |> Enum.reject(&(&1 == :stream))

      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            one_of: [
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/CreateTranslationResponseJson"
              },
              %ExOpenAI.Codegen.DocsParser.Schema{
                ref: "#/components/schemas/CreateTranslationResponseVerboseJson"
              }
            ]
          }
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Returns a list of voice consent recordings.

    List consent recordings available to your organization for creating custom voices.

    See the [custom voices guide](/docs/guides/text-to-speech#custom-voices). Custom voices are limited to eligible customers.


    ## Options

    * `:after` - **optional** - `String.t()`  
      A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `:limit` - **optional** - `integer()`  
      A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.  
      Default: `20`
    """
    (
      @type list_voice_consents_opt() :: {:after, String.t()} | {:limit, integer()}
      @spec list_voice_consents(opts :: [list_voice_consents_opt()]) ::
              {:ok, ExOpenAI.Components.VoiceConsentListResource.t()} | {:error, any()}
    )

    def list_voice_consents(opts \\ []) do
      url = "/audio/voice_consents"
      query_params = Keyword.take(opts, [:after, :limit])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [:after, :limit])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [:after, :limit] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VoiceConsentListResource"
          }
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Upload a voice consent recording.

    Upload a consent recording that authorizes creation of a custom voice.

    See the [custom voices guide](/docs/guides/text-to-speech#custom-voices) for requirements and best practices. Custom voices are limited to eligible customers.


    ## Parameters

    * `language` - **required** - `String.t()`  
      The BCP 47 language tag for the consent phrase (for example, `en-US`).

    * `name` - **required** - `String.t()`  
      The label to use for this consent recording.

    * `recording` - **required** - `binary()`  
      The consent audio recording file. Maximum size is 10 MiB.

    Supported MIME types:
    `audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.  
      Format: `binary`
    """
    (
      nil

      @spec create_voice_consent(
              language :: String.t(),
              name :: String.t(),
              recording :: binary(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VoiceConsentResource.t()} | {:error, any()}
    )

    def create_voice_consent(language, name, recording, opts \\ []) do
      url = "/audio/voice_consents"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [language: language, name: name, recording: recording]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VoiceConsentResource"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Deletes a voice consent recording.

    Delete a consent recording that was uploaded for creating custom voices.

    See the [custom voices guide](/docs/guides/text-to-speech#custom-voices). Custom voices are limited to eligible customers.


    ## Parameters

    * `:consent_id` - **required** - `String.t()`  
      The ID of the consent recording to delete.
    """
    (
      nil

      @spec delete_voice_consent(consent_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.VoiceConsentDeletedResource.t()} | {:error, any()}
    )

    def delete_voice_consent(consent_id, opts \\ []) do
      url = "/audio/voice_consents/{consent_id}"
      url = String.replace(url, "{consent_id}", to_string(consent_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{
            ref: "#/components/schemas/VoiceConsentDeletedResource"
          }
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :delete,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Retrieves a voice consent recording.

    Retrieve consent recording metadata used for creating custom voices.

    See the [custom voices guide](/docs/guides/text-to-speech#custom-voices). Custom voices are limited to eligible customers.


    ## Parameters

    * `:consent_id` - **required** - `String.t()`  
      The ID of the consent recording to retrieve.
    """
    (
      nil

      @spec get_voice_consent(consent_id :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.VoiceConsentResource.t()} | {:error, any()}
    )

    def get_voice_consent(consent_id, opts \\ []) do
      url = "/audio/voice_consents/{consent_id}"
      url = String.replace(url, "{consent_id}", to_string(consent_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = []
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VoiceConsentResource"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :get,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Updates a voice consent recording (metadata only).

    Update consent recording metadata used for creating custom voices. This endpoint updates metadata only and does not replace the underlying audio.

    See the [custom voices guide](/docs/guides/text-to-speech#custom-voices). Custom voices are limited to eligible customers.


    ## Parameters

    * `:consent_id` - **required** - `String.t()`  
      The ID of the consent recording to update.

    * `name` - **required** - `String.t()`  
      The updated label for this consent recording.
    """
    (
      nil

      @spec update_voice_consent(consent_id :: String.t(), name :: String.t(), opts :: keyword()) ::
              {:ok, ExOpenAI.Components.VoiceConsentResource.t()} | {:error, any()}
    )

    def update_voice_consent(consent_id, name, opts \\ []) do
      url = "/audio/voice_consents/{consent_id}"
      url = String.replace(url, "{consent_id}", to_string(consent_id))
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VoiceConsentResource"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"application/json",
        opts,
        convert_response
      )
    end
  )

  (
    @doc """
    Creates a custom voice.

    Create a custom voice you can use for audio output (for example, in Text-to-Speech and the Realtime API). This requires an audio sample and a previously uploaded consent recording.

    See the [custom voices guide](/docs/guides/text-to-speech#custom-voices) for requirements and best practices. Custom voices are limited to eligible customers.


    ## Parameters

    * `audio_sample` - **required** - `binary()`  
      The sample audio recording file. Maximum size is 10 MiB.

    Supported MIME types:
    `audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.  
      Format: `binary`

    * `consent` - **required** - `String.t()`  
      The consent recording ID (for example, `cons_1234`).

    * `name` - **required** - `String.t()`  
      The name of the new voice.
    """
    (
      nil

      @spec create_voice(
              audio_sample :: binary(),
              consent :: String.t(),
              name :: String.t(),
              opts :: keyword()
            ) :: {:ok, ExOpenAI.Components.VoiceResource.t()} | {:error, any()}
    )

    def create_voice(audio_sample, consent, name, opts \\ []) do
      url = "/audio/voices"
      query_params = Keyword.take(opts, [])

      query_string =
        if length(query_params) > 0 do
          "?" <> URI.encode_query(query_params)
        else
          ""
        end

      url = url <> query_string
      body_params = [audio_sample: audio_sample, consent: consent, name: name]
      optional_body_params = Keyword.take(opts, [])
      body_params = body_params ++ optional_body_params
      optional_params_to_drop = [] |> Enum.reject(&(&1 == :stream))
      opts = Keyword.drop(opts, optional_params_to_drop)

      convert_response = fn response ->
        ExOpenAI.Codegen.ResponseConverter.convert_response(
          response,
          %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/VoiceResource"}
        )
      end

      ExOpenAI.Config.http_client().api_call(
        :post,
        url,
        body_params,
        :"multipart/form-data",
        opts,
        convert_response
      )
    end
  )
end
