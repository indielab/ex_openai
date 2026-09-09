defmodule ExOpenAI.Components.UpdateConversationBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema UpdateConversationBody.

  ## Fields

  * `:metadata` - **required** - `ExOpenAI.Components.Metadata.t()`
    Set of 16 key-value pairs that can be attached to an object. This can be         useful for storing additional information about the object in a structured         format, and querying for objects via API or the dashboard.
          Keys are strings with a maximum length of 64 characters. Values are strings         with a maximum length of 512 characters.
  """
  @type t() :: %{__struct__: __MODULE__, metadata: ExOpenAI.Components.Metadata.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:metadata) => ExOpenAI.Components.Metadata.input()}
  defstruct [:metadata]
end
