defmodule ExOpenAI.Components.BetaModeration do
  use ExOpenAI.Jason

  @moduledoc """
  Moderation results or errors for the response input and output.

  ## Fields

  * `:input` - **required** - `ExOpenAI.Components.BetaModerationResultBody.t() | ExOpenAI.Components.BetaModerationErrorBody.t()`
    Moderation for the response input.

  * `:output` - **required** - `ExOpenAI.Components.BetaModerationResultBody.t() | ExOpenAI.Components.BetaModerationErrorBody.t()`
    Moderation for the response output.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input:
            ExOpenAI.Components.BetaModerationResultBody.t()
            | ExOpenAI.Components.BetaModerationErrorBody.t(),
          output:
            ExOpenAI.Components.BetaModerationResultBody.t()
            | ExOpenAI.Components.BetaModerationErrorBody.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) =>
                ExOpenAI.Components.BetaModerationResultBody.input()
                | ExOpenAI.Components.BetaModerationErrorBody.input(),
              required(:output) =>
                ExOpenAI.Components.BetaModerationResultBody.input()
                | ExOpenAI.Components.BetaModerationErrorBody.input()
            }
  defstruct [:input, :output]
end
