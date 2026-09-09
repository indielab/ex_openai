defmodule ExOpenAI.Components.BetaMCPToolCallStatus do
  @moduledoc """
  Module for representing the OpenAI schema BetaMCPToolCallStatus.

  ## Type

  `:in_progress | :completed | :incomplete | :calling | :failed`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`, `"calling"`, `"failed"`
  """
  @type t() :: (((:in_progress | :completed) | :incomplete) | :calling) | :failed
  @type input() ::
          ((((:in_progress | :completed) | :incomplete) | :calling) | :failed) | String.t()
end
