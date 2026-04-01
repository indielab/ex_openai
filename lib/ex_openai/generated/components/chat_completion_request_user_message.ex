defmodule ExOpenAI.Components.ChatCompletionRequestUserMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Messages sent by an end user, containing prompts or additional context
  information.


  ## Fields

  * `:content` - **required** - `String.t() | [ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart.t()]`  
    The contents of the user message.

  * `:name` - **optional** - `String.t()`  
    An optional name for the participant. Provides the model information to differentiate between participants of the same role.

  * `:role` - **required** - `:user`  
    The role of the messages author, in this case `user`.  
    Allowed values: `"user"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content:
            String.t() | list(ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart.t()),
          name: String.t() | nil,
          role: :user
        }
  defstruct [:content, :name, :role]
end
