defmodule ExOpenAI.Components.ChatCompletionRequestDeveloperMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Developer-provided instructions that the model should follow, regardless of
  messages sent by the user. With o1 models and newer, `developer` messages
  replace the previous `system` messages.


  ## Fields

  * `:content` - **required** - `String.t() | list(ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t())`
    The contents of the developer message.

  * `:name` - **optional** - `String.t()`
    An optional name for the participant. Provides the model information to differentiate between participants of the same role.

  * `:role` - **required** - `:developer`
    The role of the messages author, in this case `developer`.
    Allowed values: `"developer"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content:
            String.t() | list(ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()),
          name: String.t() | nil,
          role: :developer
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) =>
                String.t()
                | list(ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.input()),
              optional(:name) => String.t(),
              required(:role) => :developer | String.t()
            }
  defstruct [:content, :name, :role]
end
