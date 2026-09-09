defmodule ExOpenAI.Components.ChatCompletionRequestToolMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestToolMessage.

  ## Fields

  * `:content` - **required** - `String.t() | list(ExOpenAI.Components.ChatCompletionRequestToolMessageContentPart.t())`
    The contents of the tool message.

  * `:role` - **required** - `:tool`
    The role of the messages author, in this case `tool`.
    Allowed values: `"tool"`

  * `:tool_call_id` - **required** - `String.t()`
    Tool call that this message is responding to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content:
            String.t() | list(ExOpenAI.Components.ChatCompletionRequestToolMessageContentPart.t()),
          role: :tool,
          tool_call_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) =>
                String.t()
                | list(ExOpenAI.Components.ChatCompletionRequestToolMessageContentPart.input()),
              required(:role) => :tool | String.t(),
              required(:tool_call_id) => String.t()
            }
  defstruct [:content, :role, :tool_call_id]
end
