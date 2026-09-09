defmodule ExOpenAI.Components.RealtimeTranslationSession do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime translation session. Translation sessions continuously translate input
  audio into the configured output language.


  ## Fields

  * `:audio` - **required** - `%{ optional(:input) => %{ optional(:noise_reduction) => %{required(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil, optional(:transcription) => %{required(:model) => String.t()} | nil }, optional(:output) => %{optional(:language) => String.t()} }`
    Configuration for translation input and output audio.

  * `:expires_at` - **required** - `integer()`
    Expiration timestamp for the session, in seconds since epoch.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Unique identifier for the session that looks like `sess_1234567890abcdef`.

  * `:model` - **required** - `String.t()`
    The Realtime translation model used for this session. This field is set at
  session creation and cannot be changed with `session.update`.

  * `:type` - **required** - `:translation`
    The session type. Always `translation` for Realtime translation sessions.
    Allowed values: `"translation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio: %{
            optional(:input) => %{
              optional(:noise_reduction) =>
                %{required(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil,
              optional(:transcription) => %{required(:model) => String.t()} | nil
            },
            optional(:output) => %{optional(:language) => String.t()}
          },
          expires_at: integer(),
          id: String.t(),
          model: String.t(),
          type: :translation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:audio) => %{
                optional(:input) => %{
                  optional(:noise_reduction) =>
                    %{required(:type) => ExOpenAI.Components.NoiseReductionType.input()} | nil,
                  optional(:transcription) => %{required(:model) => String.t()} | nil
                },
                optional(:output) => %{optional(:language) => String.t()}
              },
              required(:expires_at) => integer(),
              required(:id) => String.t(),
              required(:model) => String.t(),
              required(:type) => :translation | String.t()
            }
  defstruct [:audio, :expires_at, :id, :model, :type]
end
