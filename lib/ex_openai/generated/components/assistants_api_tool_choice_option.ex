defmodule ExOpenAI.Components.AssistantsApiToolChoiceOption do
  @moduledoc """
  Controls which (if any) tool is called by the model.
  `none` means the model will not call any tools and instead generates a message.
  `auto` is the default value and means the model can pick between generating a message or calling one or more tools.
  `required` means the model must call one or more tools before responding to the user.
  Specifying a particular tool like `{"type": "file_search"}` or `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that tool.


  ## Type

  `:none | :auto | :required | ExOpenAI.Components.AssistantsNamedToolChoice.t()`
  """
  @type t() :: ((:none | :auto) | :required) | ExOpenAI.Components.AssistantsNamedToolChoice.t()
  @type input() ::
          (((:none | :auto) | :required) | String.t())
          | ExOpenAI.Components.AssistantsNamedToolChoice.input()
end
