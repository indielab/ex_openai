defmodule ExOpenAI.Components.BetaModerationConfigParam do
  use ExOpenAI.Jason

  @moduledoc """
  The moderation policy for the response input.

  ## Fields

  * `:mode` - **required** - `ExOpenAI.Components.BetaModerationMode.t()`
  """
  @type t() :: %{__struct__: __MODULE__, mode: ExOpenAI.Components.BetaModerationMode.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:mode) => ExOpenAI.Components.BetaModerationMode.input()}
  defstruct [:mode]
end
