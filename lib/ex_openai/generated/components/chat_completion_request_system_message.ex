defmodule ExOpenAI.Components.ChatCompletionRequestSystemMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Developer-provided instructions that the model should follow, regardless of
  messages sent by the user. With o1 models and newer, use `developer` messages
  for this purpose instead.


  ## Fields

  * `:content` - **required** - `String.t() | [ExOpenAI.Components.ChatCompletionRequestSystemMessageContentPart.t()]`  
    The contents of the system message.

  * `:name` - **optional** - `String.t()`  
    An optional name for the participant. Provides the model information to differentiate between participants of the same role.

  * `:role` - **required** - `:system`  
    The role of the messages author, in this case `system`.  
    Allowed values: `"system"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content:
            String.t()
            | list(ExOpenAI.Components.ChatCompletionRequestSystemMessageContentPart.t()),
          name: String.t() | nil,
          role: :system
        }
  defstruct [:content, :name, :role]
end
