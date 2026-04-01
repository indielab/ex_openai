defmodule ExOpenAI.Components.VoiceConsentListResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VoiceConsentListResource.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.VoiceConsentResource.t()]`

  * `:first_id` - **optional** - `String.t() | any()`

  * `:has_more` - **required** - `boolean()`

  * `:last_id` - **optional** - `String.t() | any()`

  * `:object` - **required** - `:list`  
    Allowed values: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.VoiceConsentResource.t()),
          first_id: (String.t() | any()) | nil,
          has_more: boolean(),
          last_id: (String.t() | any()) | nil,
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
