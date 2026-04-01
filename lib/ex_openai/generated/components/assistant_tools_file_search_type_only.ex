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
  defstruct [:type]
end
