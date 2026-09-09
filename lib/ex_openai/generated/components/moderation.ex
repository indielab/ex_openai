defmodule ExOpenAI.Components.Moderation do
  use ExOpenAI.Jason

  @moduledoc """
  Moderation results or errors for the response input and output.

  ## Fields

  * `:input` - **required** - `ExOpenAI.Components.ModerationResultBody.t() | ExOpenAI.Components.ModerationErrorBody.t()`
    Moderation for the response input.

  * `:output` - **required** - `ExOpenAI.Components.ModerationResultBody.t() | ExOpenAI.Components.ModerationErrorBody.t()`
    Moderation for the response output.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input:
            ExOpenAI.Components.ModerationResultBody.t()
            | ExOpenAI.Components.ModerationErrorBody.t(),
          output:
            ExOpenAI.Components.ModerationResultBody.t()
            | ExOpenAI.Components.ModerationErrorBody.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) =>
                ExOpenAI.Components.ModerationResultBody.input()
                | ExOpenAI.Components.ModerationErrorBody.input(),
              required(:output) =>
                ExOpenAI.Components.ModerationResultBody.input()
                | ExOpenAI.Components.ModerationErrorBody.input()
            }
  defstruct [:input, :output]
end
