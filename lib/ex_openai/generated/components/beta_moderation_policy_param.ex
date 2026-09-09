defmodule ExOpenAI.Components.BetaModerationPolicyParam do
  use ExOpenAI.Jason

  @moduledoc """
  The policy to apply to moderated response input and output.

  ## Fields

  * `:input` - **optional** - `ExOpenAI.Components.BetaModerationConfigParam.t() | nil`

  * `:output` - **optional** - `ExOpenAI.Components.BetaModerationConfigParam.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: (ExOpenAI.Components.BetaModerationConfigParam.t() | nil) | nil,
          output: (ExOpenAI.Components.BetaModerationConfigParam.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:input) => ExOpenAI.Components.BetaModerationConfigParam.input() | nil,
              optional(:output) => ExOpenAI.Components.BetaModerationConfigParam.input() | nil
            }
  defstruct [:input, :output]
end
