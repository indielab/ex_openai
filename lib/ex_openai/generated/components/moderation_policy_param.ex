defmodule ExOpenAI.Components.ModerationPolicyParam do
  use ExOpenAI.Jason

  @moduledoc """
  The policy to apply to moderated response input and output.

  ## Fields

  * `:input` - **optional** - `ExOpenAI.Components.ModerationConfigParam.t() | nil`

  * `:output` - **optional** - `ExOpenAI.Components.ModerationConfigParam.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: (ExOpenAI.Components.ModerationConfigParam.t() | nil) | nil,
          output: (ExOpenAI.Components.ModerationConfigParam.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:input) => ExOpenAI.Components.ModerationConfigParam.input() | nil,
              optional(:output) => ExOpenAI.Components.ModerationConfigParam.input() | nil
            }
  defstruct [:input, :output]
end
