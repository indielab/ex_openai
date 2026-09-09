defmodule ExOpenAI.Components.VoiceConsentDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VoiceConsentDeletedResource.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`
    The consent recording identifier.

  * `:object` - **required** - `:"audio.voice_consent"`
    Allowed values: `"audio.voice_consent"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"audio.voice_consent"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"audio.voice_consent" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
