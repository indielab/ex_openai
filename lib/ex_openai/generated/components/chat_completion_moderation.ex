defmodule ExOpenAI.Components.ChatCompletionModeration do
  use ExOpenAI.Jason

  @moduledoc """
  Moderation results or errors for the request input and generated output.

  ## Fields

  * `:input` - **required** - `ExOpenAI.Components.ChatCompletionModerationResults.t() | ExOpenAI.Components.ChatCompletionModerationError.t()`
    Moderation for the request input.

  * `:output` - **required** - `ExOpenAI.Components.ChatCompletionModerationResults.t() | ExOpenAI.Components.ChatCompletionModerationError.t()`
    Moderation for the generated output.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input:
            ExOpenAI.Components.ChatCompletionModerationResults.t()
            | ExOpenAI.Components.ChatCompletionModerationError.t(),
          output:
            ExOpenAI.Components.ChatCompletionModerationResults.t()
            | ExOpenAI.Components.ChatCompletionModerationError.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) =>
                ExOpenAI.Components.ChatCompletionModerationResults.input()
                | ExOpenAI.Components.ChatCompletionModerationError.input(),
              required(:output) =>
                ExOpenAI.Components.ChatCompletionModerationResults.input()
                | ExOpenAI.Components.ChatCompletionModerationError.input()
            }
  defstruct [:input, :output]
end
