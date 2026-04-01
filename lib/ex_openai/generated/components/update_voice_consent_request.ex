defmodule ExOpenAI.Components.UpdateVoiceConsentRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UpdateVoiceConsentRequest.

  ## Fields

  * `:name` - **required** - `String.t()`  
    The updated label for this consent recording.
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t()}
  defstruct [:name]
end
