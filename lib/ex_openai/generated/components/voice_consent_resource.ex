defmodule ExOpenAI.Components.VoiceConsentResource do
  use ExOpenAI.Jason

  @moduledoc """
  A consent recording used to authorize creation of a custom voice.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) for when the consent recording was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The consent recording identifier.

  * `:language` - **required** - `String.t()`
    The BCP 47 language tag for the consent phrase (for example, `en-US`).

  * `:name` - **required** - `String.t()`
    The label provided when the consent recording was uploaded.

  * `:object` - **required** - `:"audio.voice_consent"`
    The object type, which is always `audio.voice_consent`.
    Allowed values: `"audio.voice_consent"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          language: String.t(),
          name: String.t(),
          object: :"audio.voice_consent"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:language) => String.t(),
              required(:name) => String.t(),
              required(:object) => :"audio.voice_consent" | String.t()
            }
  defstruct [:created_at, :id, :language, :name, :object]
end
