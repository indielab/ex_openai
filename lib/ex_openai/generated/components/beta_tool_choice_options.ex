defmodule ExOpenAI.Components.BetaToolChoiceOptions do
  @moduledoc """
  Controls which (if any) tool is called by the model.

  `none` means the model will not call any tool and instead generates a message.

  `auto` means the model can pick between generating a message or calling one or
  more tools.

  `required` means the model must call one or more tools.


  ## Type

  `:none | :auto | :required`

  ## Allowed Values

  `"none"`, `"auto"`, `"required"`
  """
  @type t() :: (:none | :auto) | :required
  @type input() :: ((:none | :auto) | :required) | String.t()
end
