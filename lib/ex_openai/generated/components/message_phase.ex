defmodule ExOpenAI.Components.MessagePhase do
  @moduledoc """
  Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final_answer`).
  For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
  phase on all assistant messages — dropping it can degrade performance. Not used for user messages.


  ## Type

  `:commentary | :final_answer`

  ## Allowed Values

  `"commentary"`, `"final_answer"`
  """
  @type t() :: :commentary | :final_answer
  @type input() :: (:commentary | :final_answer) | String.t()
end
