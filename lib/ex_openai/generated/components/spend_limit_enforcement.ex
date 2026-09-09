defmodule ExOpenAI.Components.SpendLimitEnforcement do
  use ExOpenAI.Jason

  @moduledoc """
  The current enforcement state of a hard spend limit.

  ## Fields

  * `:status` - **required** - `ExOpenAI.Components.SpendLimitEnforcementStatus.t()`
    Whether the hard spend limit is currently enforcing.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          status: ExOpenAI.Components.SpendLimitEnforcementStatus.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:status) => ExOpenAI.Components.SpendLimitEnforcementStatus.input()}
  defstruct [:status]
end
