defmodule ExOpenAI.Components.MCPToolCallStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema MCPToolCallStatus.

  ## Type

  `:in_progress | :completed | :incomplete | :calling | :failed`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`, `"calling"`, `"failed"`
  """
  @type t() :: (((:in_progress | :completed) | :incomplete) | :calling) | :failed
end
