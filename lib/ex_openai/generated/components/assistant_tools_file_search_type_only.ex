defmodule ExOpenAI.Components.AssistantToolsFileSearchTypeOnly do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AssistantToolsFileSearchTypeOnly.

  ## Fields

  * `:type` - **required** - `:file_search`
    The type of tool being defined: `file_search`
    Allowed values: `"file_search"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :file_search}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :file_search | String.t()}
  defstruct [:type]
end
