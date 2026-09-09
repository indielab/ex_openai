defmodule ExOpenAI.Components.ModerationConfigParam do
  use ExOpenAI.Jason

  @moduledoc """
  The moderation policy for the response input.

  ## Fields

  * `:mode` - **required** - `ExOpenAI.Components.ModerationMode.t()`
  """
  @type t() :: %{__struct__: __MODULE__, mode: ExOpenAI.Components.ModerationMode.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:mode) => ExOpenAI.Components.ModerationMode.input()}
  defstruct [:mode]
end
