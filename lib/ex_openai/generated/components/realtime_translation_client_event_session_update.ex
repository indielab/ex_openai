defmodule ExOpenAI.Components.RealtimeTranslationClientEventSessionUpdate do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to update the translation session configuration. Translation
  sessions support updates to `audio.output.language`, `audio.input.transcription`,
  and `audio.input.noise_reduction`.


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.
    Constraints: maxLength: 512

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranslationSessionUpdateRequest.t()`
    Translation session fields to update. The session `type` and `model` are set
  at creation and cannot be changed with `session.update`.

  * `:type` - **required** - `:"session.update"`
    The event type, must be `session.update`.
    Allowed values: `"session.update"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          session: ExOpenAI.Components.RealtimeTranslationSessionUpdateRequest.t(),
          type: :"session.update"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:event_id) => String.t(),
              required(:session) =>
                ExOpenAI.Components.RealtimeTranslationSessionUpdateRequest.input(),
              required(:type) => :"session.update" | String.t()
            }
  defstruct [:event_id, :session, :type]
end
