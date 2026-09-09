defmodule ExOpenAI.Components.BetaModerationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for running moderation on the input and output of this response.

  ## Fields

  * `:model` - **required** - `String.t()`
    The moderation model to use for moderated completions, e.g. 'omni-moderation-latest'.

  * `:policy` - **optional** - `ExOpenAI.Components.BetaModerationPolicyParam.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          model: String.t(),
          policy: (ExOpenAI.Components.BetaModerationPolicyParam.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:model) => String.t(),
              optional(:policy) => ExOpenAI.Components.BetaModerationPolicyParam.input() | nil
            }
  defstruct [:model, :policy]
end
